defmodule MetricsHunter.MixProject do
  use Mix.Project

  def project do
    [
      app: :metrics_hunter,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MetricsHunter.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:gen_stage, "~> 1.0"},
      {:mox, "~> 1.0"}
    ]
  end
end