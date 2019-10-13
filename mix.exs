defmodule Rainbow.MixProject do
  use Mix.Project

  def project do
    [
      app: :rainbow,
      name: "Rainbow",
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      source_url: "https://github.com/debruinf/rainbow",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp description do
    "Input-consistent random colors"
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/debruinf/rainbow"},
    ]
  end

end
