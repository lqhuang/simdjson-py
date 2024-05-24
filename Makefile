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
	@echo "  make configure"
	@echo "  make compile"
	@echo "  make skbuild-install"
	@echo "  make test"

setup:
	${PIP} install nanobind 'scikit-build-core[pyproject]'

# launch `cmake` to generate the build system
configure:
	${CMAKE} -S . -B ${BUILD_DIR} -DPython_EXECUTABLE=${PYTHON} -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=1

clean:
	rm -rf ${BUILD_DIR}

compile:
	${CMAKE} --build ${BUILD_DIR}

# Incremental rebuilds for development
skbuild-install:
	${PIP} install --no-build-isolation --check-build-dependencies \
		--config-settings=editable.rebuild=true \
		-Cbuild-dir=${BUILD_DIR} -Ccmake.define.CMAKE_EXPORT_COMPILE_COMMANDS=1 \
		-ve .

test:
	${PYTEST} -v tests
