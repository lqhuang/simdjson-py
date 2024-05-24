nanobind_add_module(
    _lib
    NB_STATIC STABLE_ABI LTO
    NB_DOMAIN pysimdjson

    ${CMAKE_CURRENT_SOURCE_DIR}/_lib.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/error.cpp
)

install(
    TARGETS _lib
    LIBRARY DESTINATION simdjson
)
