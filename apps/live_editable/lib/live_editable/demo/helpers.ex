defmodule Phoenix.LiveEditable.Demo.Helpers do
  @moduledoc """
  View helpers for Demo Apps

  The view helper `demolink` is intended for use by all Webapps.
  """

  @doc """
  Generate a cross-demo link with valid port number.

  Note: each Demo Webapp listens on it's own port:

  | Webapp               | Dev Port | Prod Port |
  |----------------------|----------|-----------|
  | PhxDemoBaseWeb       | 4000     | 3800      |
  | PhxDemoBootstrap5Web | 4001     | 3801      |
  | PhxDemoMilligramWeb  | 4002     | 3802      |
  | PhxDemoTailwindWeb   | 4003     | 3803      |

  The `demolink` function requires two elements:

  Firstly, the current environment needs to be captured using `config.exs`:

    config :live_editable_web,
      env: Mix.env()

  Secondly, the Server URL need to be captured in each LiveView, using the
  `handle_params` callback.

    def handle_params(_params, url, socket) do
      {:noreply, assign(socket, :url, url)}
    end

  To call the function from within a LEEX block:

      <a href="<%= Phoenix.LiveEditable.Demo.Helpers.demolink(@url, :milligram) %>">
        MILLIGRAM DEMO
      </a>

  This produces:

      <a href="http://localhost:4001/">
        MILLIGRAM DEMO
      </a>

  Valid `subsite` options include:
    - :base
    - :bootstrap5
    - :milligram
    - :tailwind

  """
  def demolink(url, subsite, path \\ "/") do
    uri = URI.parse(url)
    "#{uri.scheme}://#{uri.host}:#{port_for(subsite)}#{path}"
  end

  defp port_for(subsite) do
    base_port =
      case Application.get_env(:live_editable, :env) do
        :dev -> 4000
        :test -> 3900
        :prod -> 3800
      end

    sub_port =
      case subsite do
        :base -> 0
        :bootstrap5-> 1
        :milligram -> 2
        :tailwind -> 3
      end

    base_port + sub_port
  end
  
end
