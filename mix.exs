defmodule Phoenix.LiveEditable.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_live_editable,
      version: "0.0.1",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
    ]
  end

  defp deps do
    [
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_view, "~> 0.4"}
    ]
  end
end
