defmodule ButtonsWeb.PageView do
  use ButtonsWeb, :view

  def render("healthz.json", _params) do
    %{ok: true}
  end
end
