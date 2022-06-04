defmodule PleDemoBaseWeb.PageControllerTest do
  use PleDemoBaseWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Phoenix"
  end
end
