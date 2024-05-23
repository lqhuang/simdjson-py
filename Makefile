

# Python
VENV_DIR := ./.venv
PYTHON   := $(VENV_DIR)/bin/python3
PIP      := $(VENV_DIR)/bin/pip3
PYTEST   := $(VENV_DIR)/bin/py.test

# CMAKE
CMAKE 	  := cmake
BUILD_DIR := build
SRC_DIR   := src
CURR_DIR  := $(shell pwd)

help:
	@echo "Usage:"
	@echo "  make setup"
	@echo "  make cmake-configure"
	@echo "  make cmake-compile"
	@echo "  make skbuild-install"
	@echo "  make test"

setup:
	${PIP} install nanobind 'scikit-build-core[pyproject]'

# launch `cmake` to generate the build system
cmake-configure:
	${CMAKE} -S . -B ${BUILD_DIR} -DPython_EXECUTABLE=${PYTHON}

cmake-clean:
	rm -Rf ${BUILD_DIR}

cmake-compile:
	${CMAKE} --build ${BUILD_DIR}

# Incremental rebuilds
skbuild-install:
	${PIP} install --no-build-isolation --config-settings=editable.rebuild=true -Cbuild-dir=build -ve .

test:
	${PYTEST} -v .
