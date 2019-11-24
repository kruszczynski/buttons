defmodule ButtonsWeb.ButtonController do
  use ButtonsWeb, :controller
  alias Buttons.{Repo, Button}

  def index(conn, _params) do
    buttons = Repo.all(Button)

    render(conn, "index.json", buttons: buttons)
  end
end
