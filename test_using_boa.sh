set -x
set -e

export CONDA_BLD_PATH="${PWD}/built_with_boa"
boa convert package/recipe/meta.yaml > package/recipe/recipe.yaml
boa build package/recipe --no-test
mamba create -n test_env_boa_sfdg --channel "file://${CONDA_BLD_PATH}" boa-tester python=3.6 pytest
conda run -n test_env_boa_sfdg pytest --pyargs boa_tester
