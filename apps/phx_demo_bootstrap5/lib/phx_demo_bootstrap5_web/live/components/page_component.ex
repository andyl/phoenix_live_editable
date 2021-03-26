defmodule PhxDemoBootstrap5Web.PageLive.PageComponent do
  @moduledoc """
  TBD
  """

  use Phoenix.LiveComponent
  # use Phoenix.LiveEditable

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
          <%# live_edit(assigns, @text_data, type: "text", target: @myself, on_submit: "update_text", id: "cedit1") %>
        </td>
        <td>
          <%# @text_data %>
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
  
  # ----- view helpers -----

  # def folder_btn(uistate, myself) do
  #   label = "#{plus_circle_svg("up-3 h-5 inline text-blue-500")} Folder<br/>"
  #   if uistate.mode != "add_folder" do
  #     "<a phx-click='add_folder' class='bluelink' phx-target='#{myself}' href='#'>#{label}</a>"
  #   else
  #     ""
  #   end |> raw()
  # end
  #
  # def feed_btn(uistate, myself) do
  #   label = "#{plus_circle_svg("up-3 h-5 inline text-blue-500")} Feed<br/>"
  #   if uistate.mode != "add_feed" do
  #     "<a phx-click='add_feed' class='bluelink' phx-target='#{myself}' href='#'>#{label}</a>"
  #   else
  #     ""
  #   end |> raw()
  # end

  # ----- event handlers -----

~  # def handle_event("update_text", %{"editable_text" => new_value}, socket) do
  #   {:noreply, assign(socket, text_data: new_value)}
  # end
  #
  # def handle_event("update_select", %{"editable_select" => new_value}, socket) do
  #   {:noreply, assign(socket, select_data: new_value)}
  # end

end
