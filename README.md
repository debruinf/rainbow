# Rainbow

Rainbow provides functions for generating constistent colors based on the input provided.

## Basic usage

```elixir
  iex> Rainbow.colorize("boring grey")
  "#82D458"

  iex> Rainbow.colorize("no hex color", format: "rgba")
  "rgba(45, 100, 139, 1.0)"

  iex> Rainbow.colorize("almost invisible", format: "rgba", opacity: 0.1)
  "rgba(88, 98, 191, 0.1)"
  ```

#### Input

One of:
- string
- integer
- float
- atom
- binary

#### Options
- format: the format of output
    - "hex_color" (default)
    - "rgba"
- opacity: used in case `format: "rgba"`
    - 0.0 - 1.0 (default)

## Installation

The package can be installed by adding `rainbow` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rainbow, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/rainbow](https://hexdocs.pm/rainbow).

