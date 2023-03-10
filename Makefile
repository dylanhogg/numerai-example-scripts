.EXPORT_ALL_VARIABLES:
CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh

conda-install:
	./conda-install.sh

conda-list:
	$(CONDA_ACTIVATE); conda activate ./env; conda list

clean-env:
	rm -rf env

run:
	$(CONDA_ACTIVATE); conda activate ./env; PYTHONPATH='./src' python -m app req1 --optional-arg opt1

.DEFAULT_GOAL := help
.PHONY: help
help:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
