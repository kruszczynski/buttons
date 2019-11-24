defmodule ButtonsWeb.PageController do
  use ButtonsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
