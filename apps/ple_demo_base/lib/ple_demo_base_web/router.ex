defmodule PleDemoBaseWeb.Router do
  use PleDemoBaseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PleDemoBaseWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PleDemoBaseWeb do
    pipe_through :browser

    live "/", PageLive
    live "/home", PageLive
    live "/test", Test1Live
    live "/test1", Test1Live
    live "/test2", Test2Live
    live "/test3", Test3Live
    live "/test4", Test4Live
    live "/test5", Test5Live
  end

end
