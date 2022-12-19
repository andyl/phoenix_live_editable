defmodule LiveEditable.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.0.1-alpha.2",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Phoenix.LiveEditable",
      description: "LiveView components for inline editing",
      docs: docs()
      # xref: [exclude: [Phoenix.HTML, Phoenix.LiveEditable.ViewUtil, Phoenix.LiveEditableComponent]],
      # aliases: aliases(),
      # releases: releases()
    ]
  end

  defp deps do
    [
    ]
  end

  defp docs do
    [
      main: "readme",
      extra_section: "GUIDES",
      extras: extras()
    ]
  end

  defp extras do
    [
      "apps/phoenix_live_editable/README.md",
      "apps/phoenix_live_editable/guides/installing.md",
      "apps/phoenix_live_editable/guides/using.md",
      "apps/phoenix_live_editable/guides/adapters.md",
      "apps/phoenix_live_editable/guides/handlers.md"
    ]
  end

  # defp releases do
  #   [
  #     demo: [
  #       include_executable_for: [:unix],
  #       applications: [
  #         phoenix_live_editable: :permanent,
  #         ple_demo_base: :permanent,
  #         ple_demo_milligram: :permanent,
  #         ple_demo_tailwind3: :permanent,
  #       ]
  #     ]
  #   ]
  # end

  # defp aliases do
  #   [
  #     # run `mix setup` in all child apps
  #     setup: ["cmd mix setup"],
  #     "assets.deploy": [
  #       "esbuild ple_demo_base --minify",
  #       "esbuild ple_demo_milligram --minify",
  #       "esbuild ple_demo_tailwind3 --minify",
  #       "phx.digest"
  #     ]
  #   ]
  # end
end
