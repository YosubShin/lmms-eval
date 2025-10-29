#!/bin/bash
#SBATCH --job-name=lmms-eval
#SBATCH --partition=kill-shared
#SBATCH --time=00:30:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G

set -euo pipefail

module purge >/dev/null 2>&1 || true
module load lang/Python/3.11.5-GCCcore-13.2.0 >/dev/null 2>&1 || true
module load system/CUDA/12.2.0 >/dev/null 2>&1 || true

RESULTS_ROOT="${KOA_ML_RESULTS_ROOT:-$HOME/koa-results}"
JOB_DIR="${RESULTS_ROOT}/${SLURM_JOB_ID}"
REPO_DIR="${JOB_DIR}/repo"
mkdir -p "${REPO_DIR}"

if [[ -d "${REPO_DIR}" ]]; then
  cd "${REPO_DIR}"
fi

source "scripts/setup_env.sh"

srun --cpu-bind=cores sleep 60
