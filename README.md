# Exscm

[![Build Status](https://travis-ci.org/treebee/exscm.svg?branch=master)](https://travis-ci.org/treebee/exscm)
[![Coverage Status](https://coveralls.io/repos/github/treebee/exscm/badge.svg?branch=master)](https://coveralls.io/github/treebee/exscm?branch=master)
[![Hex.pm](https://img.shields.io/hexpm/v/exscm.svg)](https://hex.pm/packages/exscm)

**Manage release versions by scm tags**

Inspired by [setuptools_scm](https://github.com/pypa/setuptools_scm).

## Usage with distillery

```elixir
def deps do
  [{:exscm, "~> ?.?.?"}]
end
```

Set the version with Exascm's `get_version` function:

```elixir
release :test do
  set version: Exascm.get_version()
end
```

