
VENV_NAME := ./.venv

PYTHON    := $(VENV_NAME)/bin/python3
PIP	   	  := $(VENV_NAME)/bin/pip3

# CMAKE
CMAKE 	  := cmake
BUILD_DIR := build
SRC_DIR   := src
CURR_DIR  := $(shell pwd)

# Dev
setup:
	${PIP} install nanobind 'scikit-build-core[pyproject]'

# launch `cmake` to generate the build system
cmake-init:
	rm -Rf ${BUILD_DIR}
	${CMAKE} -S . -B ${BUILD_DIR} -DPython_EXECUTABLE=${PYTHON}

cmake-compile:
	${CMAKE} --build ${BUILD_DIR}

# Incremental rebuilds
skbuild-install:
	${PIP} install --no-build-isolation -ve .
	#${PIP} install --no-build-isolation -Ceditable.rebuild=true -ve .