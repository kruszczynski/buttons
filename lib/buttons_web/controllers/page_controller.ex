defmodule ButtonsWeb.PageController do
  use ButtonsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def healthz(conn, _params) do
    conn
    |> render("healthz.json")
  end
end
