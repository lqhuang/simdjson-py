from importlib.metadata import version

from simdjson._simdjson_version import (
    SIMDJSON_VERSION_MAJOR,
    SIMDJSON_VERSION_MINOR,
    SIMDJSON_VERSION_REVISION,
)

__version__ = version("simdjson")
# version of the C++ simdjson library
__simdjson_version__ = (
    f"{SIMDJSON_VERSION_MAJOR}.{SIMDJSON_VERSION_MINOR}.{SIMDJSON_VERSION_REVISION}"
)
