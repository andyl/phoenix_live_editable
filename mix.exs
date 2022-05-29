defmodule LiveEditable.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.0.1",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      xref: [exclude: [Phoenix.HTML, Phoenix.LiveEditable]],
      aliases: aliases()
    ]
  end

  defp deps do
    [
    ]
  end

  defp aliases do
    [
      # run `mix setup` in all child apps
      setup: ["cmd mix setup"],
      "assets.deploy": [
        "esbuild ple_demo_base --minify",
        "esbuild ple_demo_milligram --minify",
        "esbuild ple_demo_tailwind3 --minify",
        "phx.digest"
      ]
    ]
  end
end
