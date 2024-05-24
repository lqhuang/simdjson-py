from importlib.metadata import version

from simdjson._lib import (
    SIMDJSON_VERSION_MAJOR,
    SIMDJSON_VERSION_MINOR,
    SIMDJSON_VERSION_REVISION,
)
from simdjson._lib import __version__ as __simdjson_version__

__version__ = version("simdjson")
