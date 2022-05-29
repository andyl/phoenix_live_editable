defmodule PleDemoTailwind3Web.PageController do
  use PleDemoTailwind3Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
