defmodule RumblWeb.PageController do
  use RumblWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)
    render(conn, :index)
  end
end
