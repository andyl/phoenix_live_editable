defmodule PhxDemoBootstrap5Web.PageLive.PageComponent do
  @moduledoc """
  TBD
  """

  use Phoenix.LiveComponent
  use Phoenix.LiveEditable

  # ----- lifecycle callbacks -----

  @impl true
  def update(session, socket) do
    opts = %{
      textdata: session[:textdata] || "MYDATA"
    }
    {:ok, assign(socket, opts)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <table class='table table-sm'>
      <thead>
        <tr>
          <th>
            type
          </th>
          <th>
            input
          </th>
          <th>
            output
          </th>
      </thead>
      <tbody>
      <tr>
        <td>
          input
        </td>
        <td>
          <%= live_edit(assigns, @textdata, type: "text", target: @myself, on_submit: "update_ctext", id: "cedit1") %>
        </td>
        <td>
          <%= @textdata %>
        </td>
      </tr>
      <tr>
        <td>
          select
        </td>
        <td>
          <%# live_edit(assigns, @select_data, type: "select", target: @myself, options: @select_opts, on_submit: "update_select", id: "cedit2") %>
        </td>
        <td>
          <%# @select_data %>
        </td>
      </tr>
      </tbody>
    </table>
    """
  end
  
  # ----- event handlers -----

  def handle_event("update_ctext", %{"editable_text" => new_value}, socket) do
    {:noreply, assign(socket, textdata: new_value, focus: "asdf")}
  end

end
