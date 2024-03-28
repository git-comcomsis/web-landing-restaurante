defmodule WebLandingRestauranteWeb.PageController do
  use WebLandingRestauranteWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def contacto(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :contacto, layout: false)
  end
end
