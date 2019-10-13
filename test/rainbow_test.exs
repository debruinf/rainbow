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

    [r, g, b, o] = trim_brackets(with_brackets)
    assert String.to_integer(r) >= 0
    assert String.to_integer(r) <= 255
    assert String.to_integer(g) >= 0
    assert String.to_integer(g) <= 255
    assert String.to_integer(b) >= 0
    assert String.to_integer(b) <= 255

    assert String.to_float(o) >= 0.0
    assert String.to_float(o) <= 1.0
  end

  defp trim_brackets(input) do
    input
    |> String.trim_leading("(")
    |> String.trim_trailing(")")
    |> String.split(",")
    |> Enum.map(fn(x) -> String.trim(x) end)
  end
end
