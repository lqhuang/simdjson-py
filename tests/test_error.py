import pytest

from simdjson._lib.error import SimdjsonError


def test_simdjson_error():
    with pytest.raises(SimdjsonError):
        raise SimdjsonError("Error message")
