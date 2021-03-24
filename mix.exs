defmodule HammoxExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :hammox_example,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HammoxExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hammox, "~> 0.5", only: :test},
      {:finch, "~> 0.6"}
    ]
  end
end
