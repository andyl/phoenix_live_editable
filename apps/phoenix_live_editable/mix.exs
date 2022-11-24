defmodule Phoenix.LiveEditable.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_live_editable,
      version: "0.0.1-alpha.2",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/andyl/phoenix_live_editable",
      homepage_url: "https://phoenix-live-editable.fly.dev",
      name: "Phoenix.LiveEditable",
      description: "Simple LiveView components for inline editing",
      aliases: aliases(),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      mod: {Phoenix.LiveEditable.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:phoenix_pubsub, "~> 2.1"},
      {:phoenix_html, "~> 3.2"},
      {:phoenix_live_view, "~> 0.18"}
    ]
  end

  defp docs do
    [
      main: "Phoenix.LiveEditable",
      extra_section: "GUIDES",
      extras: extras()
    ]
  end

  defp extras do
    [
      "README.md",
      "guides/installing.md",
      "guides/using.md",
      "guides/interfaces.md"
    ]
  end

  defp package do
    [
      maintainers: ["Andy Leak"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/andyl/phoenix_live_editable"
      }
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
