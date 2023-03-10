#!/bin/bash
set -e

echo "***** CREATE: conda evironment (plays better on osx-arm64)"
conda create -y --prefix ./env
eval "$(conda shell.bash hook)"
conda activate ./env

echo "***** CONDA INSTALL:..."
conda install -y halo lightgbm numpy pandas pyarrow requests scikit-learn scipy six tabulate tqdm matplotlib

echo "***** PIP INSTALL:..."
pip install numerapi

conda list --export > conda_export.txt
