defmodule PleDemoMilligramWeb.PageController do
  use PleDemoMilligramWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
