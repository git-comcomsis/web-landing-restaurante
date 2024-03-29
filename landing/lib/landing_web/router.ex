defmodule LandingWeb.Router do
  use LandingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LandingWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LandingWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/phx", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", LandingWeb do
  #   pipe_through :api
  # end
end
