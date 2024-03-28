defmodule WebLandingRestauranteWeb.Router do
  use WebLandingRestauranteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WebLandingRestauranteWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebLandingRestauranteWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/contacto", PageController, :contacto
  end

  # Other scopes may use custom stacks.
  # scope "/api", WebLandingRestauranteWeb do
  #   pipe_through :api
  # end
end
