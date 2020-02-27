defmodule ButtonsWeb.ButtonController do
  use ButtonsWeb, :controller

  def index(conn, _params) do
    buttons = [
      %{
        id: 1,
        label: "Button",
      },
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
    ]

    render(conn, "index.json", buttons: buttons)
  end
end
