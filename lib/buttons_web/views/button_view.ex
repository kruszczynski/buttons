defmodule ButtonsWeb.ButtonView do
  use ButtonsWeb, :view

  def render("index.json", %{buttons: buttons}) do
    buttons
    |> Enum.map(&(%{id: &1.id, label: &1.label}))
  end
end
