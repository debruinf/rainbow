defmodule RainbowTest do
  use ExUnit.Case
  doctest Rainbow

  test "returns a consistent color value" do
    assert Rainbow.colorize("foo") == Rainbow.colorize("foo")
  end

  test "returns a valid hex color" do
    val = Rainbow.colorize("foo")

    assert String.length(val) == 7
    assert String.at(val, 0) == "#"
  end

  test "returns a valid rgba color if option is set" do
    rgba_value = Rainbow.colorize("bar", format: "rgba")
    assert String.slice(rgba_value, 0..3) == "rgba"

    with_brackets = String.slice(rgba_value, 4, 999)
    assert String.first(with_brackets) == "("
    assert String.last(with_brackets) == ")"

    [r, g, b, o] = return_rgba_values(with_brackets)
    assert String.to_integer(r) >= 0
    assert String.to_integer(r) <= 255
    assert String.to_integer(g) >= 0
    assert String.to_integer(g) <= 255
    assert String.to_integer(b) >= 0
    assert String.to_integer(b) <= 255

    assert String.to_float(o) >= 0.0
    assert String.to_float(o) <= 1.0
  end

  test "support for strings" do
    value = "string"
    assert String.valid?(value)
    assert Rainbow.colorize(value)
  end

  test "support for integers" do
    value = 42
    assert is_integer(value)
    assert Rainbow.colorize(value)
  end

  test "support for floats" do
    value = 3.14
    assert is_float(value)
    assert Rainbow.colorize(value)
  end

  test "support for atoms" do
    value = :molecule
    assert is_atom(value)
    assert Rainbow.colorize(value)
  end

  test "support for binary values" do
    value = <<123, 234, 345>>
    assert is_binary(value)
    assert Rainbow.colorize(value)
  end

  defp return_rgba_values(input) do
    input
    |> String.trim_leading("(")
    |> String.trim_trailing(")")
    |> String.split(",")
    |> Enum.map(fn(x) -> String.trim(x) end)
  end
end
