# Localstack Workspace

This repository contains scripts and documentation for working with S3-compatible storage and related utilities.

## Structure

- `calculate-s3.sh`: Shell script for S3 calculations.
- `logs-tail.sh`: Shell script for tailing logs.
- `docs/s3/calculate.py`: Python script for S3 calculations.
- `docs/s3/s3-compatibilty.md`: Documentation on S3 compatibility.
- `docs/s3/data/`: Contains CSV data files for S3 cost and breakeven analysis.

## Usage

- Run shell scripts directly from the root directory:
  ```bash
  ./calculate-s3.sh
  ./logs-tail.sh
  ```
- Python scripts are located in `docs/s3/`.

## Data

- `hetzner_vs_r2_breakeven.csv`: Breakeven analysis between Hetzner and R2.
- `hetzner_vs_r2_examples.csv`: Example data comparing Hetzner and R2.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
