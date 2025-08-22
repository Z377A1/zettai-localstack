# Adjustable inputs — edit these lists to your exact numbers
storage_tb_list = [1, 2, 5, 10]          # total storage in TB
egress_tb_list = [0, 1, 2, 10, 50, 100]  # total egress in TB per month

# Pricing (as given)
HETZNER_BASE_EUR = 6.89      # includes 1 TB storage + 1 TB egress
HETZNER_EXTRA_STORAGE_EUR = 6.89  # per extra TB storage
HETZNER_EXTRA_EGRESS_EUR = 1.38   # per extra TB egress
R2_STORAGE_USD = 15.00       # per TB, egress $0

import os
import pandas as pd
from itertools import product

def hetzner_cost_eur(storage_tb: float, egress_tb: float) -> float:
    extra_storage_tb = max(storage_tb - 1.0, 0.0)
    extra_egress_tb = max(egress_tb - 1.0, 0.0)
    return (
        HETZNER_BASE_EUR
        + extra_storage_tb * HETZNER_EXTRA_STORAGE_EUR
        + extra_egress_tb * HETZNER_EXTRA_EGRESS_EUR
    )

def r2_cost_usd(storage_tb: float) -> float:
    return storage_tb * R2_STORAGE_USD  # egress $0

rows = []
for s, e in product(storage_tb_list, egress_tb_list):
    rows.append({
        "Storage (TB)": s,
        "Egress (TB)": e,
        "Hetzner Cost (EUR)": round(hetzner_cost_eur(s, e), 2),
        "Cloudflare R2 Cost (USD)": round(r2_cost_usd(s), 2)
    })

df = pd.DataFrame(rows).sort_values(["Storage (TB)", "Egress (TB)"]).reset_index(drop=True)

# Break-even egress (where Hetzner ~= R2) for each storage level
# Equation: 6.89*S + 1.38*E - 1.38 = 15*S  =>  E = (8.11*S + 1.38) / 1.38
def break_even_egress_tb(storage_tb: float) -> float:
    return (8.11 * storage_tb + 1.38) / 1.38

be = pd.DataFrame({
    "Storage (TB)": storage_tb_list,
    "Break-even Egress (TB)": [round(break_even_egress_tb(s), 2) for s in storage_tb_list],
    "Where": ["Hetzner cheaper below this egress; R2 cheaper above" for _ in storage_tb_list]
})

# Save CSVs for download
table_path = "docs/s3/data/hetzner_vs_r2_examples.csv"
breakeven_path = "docs/s3/data/hetzner_vs_r2_breakeven.csv"

# Ensure parent directory exists
os.makedirs(os.path.dirname(table_path), exist_ok=True)
os.makedirs(os.path.dirname(breakeven_path), exist_ok=True)

df.to_csv(table_path, index=False)
be.to_csv(breakeven_path, index=False)

print("Hetzner vs R2 — Cost Examples")
print(df)
print("\nHetzner vs R2 — Break-even Egress by Storage")
print(be)

(table_path, breakeven_path)
