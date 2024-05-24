import importlib.metadata

from simdjson._lib import __version__
from simdjson._version import __simdjson_version__


def test_simdjson_version():
    assert __simdjson_version__ == __version__
    assert __version__ == "3.6.0"
