defmodule PhxDemoTailwindWeb.PageLiveTest do
  use PhxDemoTailwindWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome"
    assert render(page_live) =~ "Welcome"
  end
end
