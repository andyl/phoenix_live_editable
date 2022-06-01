defmodule Phx.Demo.Helpers do
  @moduledoc """
  View helpers for Demo Apps

  The view helper `demolink` is intended for use by all demo Webapps.
  """

  @doc """
  Generate a cross-demo link with valid port number.

  Note: each Demo Webapp listens on it's own port:

  | Webapp              | Dev Port | Prod Port |
  |---------------------|----------|-----------|
  | PhxDemoBaseWeb      | 4040     | 8080      |
  | PhxDemoMilligramWeb | 4041     | 8081      |
  | PhxDemoTailwind3Web | 4042     | 8082      |

  The `demolink` function requires two elements:

  Firstly, the current environment needs to be captured using `config.exs`:

    config :phoenix_live_editable,
      env: Mix.env()

  Secondly, the Server URL need to be captured in each LiveView, using the
  `handle_params` callback.

    def handle_params(_params, url, socket) do
      {:noreply, assign(socket, :url, url)}
    end

  To call the function from within a HEEX block:

      <a href="<%= Phx.Demo.Helpers.demolink(@url, :milligram) %>">
        MILLIGRAM DEMO
      </a>

  This produces:

      <a href="http://localhost:4001/">
        MILLIGRAM DEMO
      </a>

  Valid `url` options include:
    - :base
    - :milligram
    - :tailwind3

  """
  def demolink(url, subsite, label \\ "") do
    uri = URI.parse(url)
    tgt_port = port_for(subsite)

    alt_label = case subsite do
      :base -> ""
      _ -> label
    end

    src_port = case uri.port do
      80 -> 8080
      443 -> 8080
      alt -> alt
    end

    if src_port == tgt_port do
      "<b>" <> label_for(subsite) <> alt_label <> "</b>"
    else
      path = "#{uri.scheme}://#{uri.host}:#{port_for(subsite)}/"
      text = label_for(subsite) <> alt_label
      "<a href='#{path}'>#{text}</a>"
    end
  end

  @doc """
  Generate nav-links for all sites.
  """
  def navlinks(url) do
    [:base, :milligram, :tailwind3]
    |> Enum.map(&demolink(url, &1, " Demo"))
    |> Enum.join("                           | ")
  end

  defp label_for(subsite) do
    case subsite do
      :base -> "Home"
      :milligram -> "Milligram"
      :tailwind3 -> "Tailwind3"
      :bootstrap5 -> "Bootstrap5"
    end
  end

  defp port_for(subsite) do
    base_port =
      case Application.get_env(:phoenix_live_editable, :env) do
        :dev -> 4040
        :test -> 6060
        :prod -> 8080
      end

    sub_port =
      case subsite do
        :base -> 0
        :milligram -> 1
        :tailwind3 -> 2
        :bootstrap5 -> 3
      end

    base_port + sub_port
  end
end
