import importlib.metadata

from simdjson._version import __simdjson_version__, __version__


def test_py_version():
    assert __version__ == importlib.metadata.version("simdjson")
    assert __version__ == "0.0.1"


def test_simdjson_version():
    assert __simdjson_version__ == "3.6.0"
