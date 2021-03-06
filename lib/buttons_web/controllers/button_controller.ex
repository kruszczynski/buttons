defmodule ButtonsWeb.ButtonController do
  use ButtonsWeb, :controller

  def index(conn, _params) do
    buttons = [
      %{
        id: 2,
        label: "Beton",
      },
      %{
        id: 3,
        label: "Close the window",
      },
      %{
        id: 4,
        label: "How about more buttons",
      },
      %{
        id: 5,
        label: "v0.2.1",
      },
    ]

    render(conn, "index.json", buttons: buttons)
  end
end
