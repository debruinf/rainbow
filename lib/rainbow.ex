defmodule Rainbow do
  @moduledoc """
  Rainbow provides functions for generating constistent colors based on the input provided.
  """

  @default_format "hexcolor"
  @default_opacity 1.0

  @doc """
  Returns an input-consistent random color in the format of choice. Inputs supported: string

  Options:
  - format: "hexcolor" (default), "rgba"
  - opacity: float between 0.0 and 1.0 (defaults to 1.0, only used in case `format: "rgba"`)

  ## Examples

      iex> Rainbow.colorize("boring grey")
      "#82D458"

      iex> Rainbow.colorize("no hex color", format: "rgba")
      "rgba(45, 100, 139, 1.0)"

  """
  def colorize(input, options \\ []) do
    format =  Keyword.get(options, :format, @default_format)
    opacity =  Keyword.get(options, :opacity, @default_opacity)

    hex_hash = :crypto.hash(:md5, input) |> Base.encode16()
    case format do
      "hexcolor" -> hex_color(hex_hash)
      "rgba" -> rgba_color(hex_hash, opacity)
    end
  end

  defp hex_color(hash) do
    first_six = String.slice(hash, 0..5)
    "##{first_six}"
  end

  defp rgba_color(hash, opacity) do
    <<r>> = hash
            |> String.slice(0..1)
            |> Base.decode16!()
    <<g>> = hash
            |> String.slice(2..3)
            |> Base.decode16!()
    <<b>> = hash
            |> String.slice(4..5)
            |> Base.decode16!()
    "rgba(#{r}, #{g}, #{b}, #{opacity})"
  end
end
