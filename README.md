# python_example

[![Gitter][gitter-badge]][gitter-link]

| CI                 | status                                                                |
| ------------------ | --------------------------------------------------------------------- |
| Linux/macOS Travis | [![Travis-CI][travis-badge]][travis-link]                             |
| MSVC 2019          | [![AppVeyor][appveyor-badge]][appveyor-link]                          |
| conda.recipe       | [![Conda Actions Status][actions-conda-badge]][actions-conda-link]    |
| pip builds         | [![Pip Actions Status][actions-pip-badge]][actions-pip-link]          |
| [`cibuildwheel`][] | [![Wheels Actions Status][actions-wheels-badge]][actions-wheels-link] |

[gitter-badge]: https://badges.gitter.im/pybind/Lobby.svg
[gitter-link]: https://gitter.im/pybind/Lobby
[actions-badge]:
  https://github.com/pybind/python_example/workflows/Tests/badge.svg
[actions-conda-link]:
  https://github.com/pybind/python_example/actions?query=workflow%3A%22Conda
[actions-conda-badge]:
  https://github.com/pybind/python_example/workflows/Conda/badge.svg
[actions-pip-link]:
  https://github.com/pybind/python_example/actions?query=workflow%3A%22Pip
[actions-pip-badge]:
  https://github.com/pybind/python_example/workflows/Pip/badge.svg
[actions-wheels-link]:
  https://github.com/pybind/python_example/actions?query=workflow%3AWheels
[actions-wheels-badge]:
  https://github.com/pybind/python_example/workflows/Wheels/badge.svg
[travis-link]: https://travis-ci.org/pybind/python_example
[travis-badge]:
  https://travis-ci.org/pybind/python_example.svg?branch=master&status=passed
[appveyor-link]: https://ci.appveyor.com/project/wjakob/python-example

<!-- TODO: get a real badge link for appveyor -->

[appveyor-badge]:
  https://travis-ci.org/pybind/python_example.svg?branch=master&status=passed

## Installation

```sh
pip install simdjson
```

## References

- [simdjson Documentation](https://simdjson.github.io/simdjson/)

## Building the documentation

Documentation for the example project is generated using Sphinx. Sphinx has the
ability to automatically inspect the signatures and documentation strings in the
extension module to generate beautiful documentation in a variety formats. The
following command generates HTML-based reference documentation; for other
formats please refer to the Sphinx manual:

- `cd docs`
- `make html`

## License

License of `simdjson-py` is Apache 2.0 that is the same to upstream project
(`simdjson`). See [LICENSE](LICENSE) for details.
