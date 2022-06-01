defmodule PleDemoTailwind3Web.PageControllerTest do
  use PleDemoTailwind3Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Phoenix"
  end
end
