defmodule ButtonsWeb.PageController do
  use ButtonsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def healthz(conn, _params) do
    conn
    |> maybe_set_resp(422)
    |> render("healthz.json")
  end

  defp maybe_set_resp(conn, status) do
    if(DateTime.compare(DateTime.utc_now, ~U[2020-02-26 17:00:00Z]) == :lt) do
      resp(conn, status, "")
    else
      conn
    end
  end
end
