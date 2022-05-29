defmodule PleDemoBaseWeb.PageController do
  use PleDemoBaseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
