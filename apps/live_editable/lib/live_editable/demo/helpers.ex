defmodule Phoenix.LiveEditable.Demo.Helpers do
  @moduledoc """
  View helpers for Demo Apps

  The view helper `demolink` is intended for use by all Webapps.
  """

  @doc """
  Generate a cross-demo link with valid port number.

  Note: each Demo Webapp listens on it's own port:

  | Webapp                 | Dev Port | Prod Port |
  |------------------------|----------|-----------|
  | LiveEditableWeb (home) | 4000     | 3800      |
  | PhxDemoMilligramWeb    | 4001     | 3801      |
  | PhxDemoBootstrapWeb    | 4002     | 3802      |
  | PhxDemoTailwindWeb     | 4003     | 3803      |

  The `demolink` function requires two elements:

  Firstly, the Server URL need to be captured in each LiveView, using the
  `handle_params` callback.

    def handle_params(_params, url, socket) do
      {:noreply, assign(socket, :url, url)}
    end

  Secondly, the current environment needs to be captured using `config.exs`:

    config :live_editable_web,
      env: Mix.env()

  Valid `subsite` options include:
    - :home
    - :milligram
    - :bootstrap
    - :tailwind
  """
  def demolink(url, subsite, path \\ "/") do
    IO.inspect url, label: "url"
    uri = URI.parse(url)
    "#{uri.scheme}://#{uri.host}:#{port_for(subsite)}#{path}"
  end

  defp port_for(subsite) do
    base_port =
      case Application.get_env(:live_editable_web, :env) do
        :dev -> 4000
        :test -> 3900
        :prod -> 3800
      end

    sub_port =
      case subsite do
        :home -> 0
        :milligram -> 1
        :bootstrap -> 2
        :tailwind -> 3
      end

    base_port + sub_port
  end
  
end
