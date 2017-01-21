# Exscm

[![Build Status](https://travis-ci.org/treebee/exscm.svg?branch=master)](https://travis-ci.org/treebee/exscm)

**Manage release versions by scm tags**

Inspired by [setuptools_scm](https://github.com/pypa/setuptools_scm).

## Usage with distillery

```elixir
def deps do
  [{:exscm, "~> ?.?.?"}]
end
```

Add the `exascm` plugin to your release config:

```elixir
release :test do
  plugin Exascm
end
```
