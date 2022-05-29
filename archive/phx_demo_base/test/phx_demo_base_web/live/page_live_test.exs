defmodule PhxDemoBaseWeb.PageLiveTest do
  use PhxDemoBaseWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Phoenix"
    assert render(page_live) =~ "Phoenix"
  end
end
