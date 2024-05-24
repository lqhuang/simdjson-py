#include <nanobind/nanobind.h>
#include <simdjson/simdjson_version.h>

#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

namespace nb = nanobind;

void init_error(nb::module_ &);

NB_MODULE(_lib, m) {
  m.doc() = "simdjson-py: Python native bindings for simdjson project";

  m.attr("__version__") = static_cast<nb::str>(SIMDJSON_VERSION);
  m.attr("SIMDJSON_VERSION_MAJOR") =
      static_cast<unsigned int>(simdjson::SIMDJSON_VERSION_MAJOR);
  m.attr("SIMDJSON_VERSION_MINOR") =
      static_cast<unsigned int>(simdjson::SIMDJSON_VERSION_MINOR);
  m.attr("SIMDJSON_VERSION_REVISION") =
      static_cast<unsigned int>(simdjson::SIMDJSON_VERSION_REVISION);

  nb::module_ error = m.def_submodule("error", "simdjson submodule");
  init_error(error);
}