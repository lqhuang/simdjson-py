#pragma once

#include <nanobind/nanobind.h>
#include <simdjson/error.h>

namespace nb = nanobind;

void init_error(nb::module_ &m) {
  nb::exception<simdjson::simdjson_error>(m, "SimdjsonError");
}