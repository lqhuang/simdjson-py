#include <nanobind/nanobind.h>
#include <simdjson/simdjson_version.h>

NB_MODULE(_simdjson_version, m) {
  m.attr("SIMDJSON_VERSION_MAJOR") =
      static_cast<unsigned int>(simdjson::SIMDJSON_VERSION_MAJOR);
  m.attr("SIMDJSON_VERSION_MINOR") =
      static_cast<unsigned int>(simdjson::SIMDJSON_VERSION_MINOR);
  m.attr("SIMDJSON_VERSION_REVISION") =
      static_cast<unsigned int>(simdjson::SIMDJSON_VERSION_REVISION);
}