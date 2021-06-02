set -x
set -e


export CONDA_BLD_PATH="${PWD}/built_with_conda"
conda build package/recipe --no-test
conda create -n test_env_conda_sfdgj --channel "file://${CONDA_BLD_PATH}" boa-tester python=3.6 pytest
conda run -n test_env_conda_sfdgj pytest --pyargs boa_tester





