defmodule Buttons.Button do
  use Ecto.Schema
  import Ecto.Changeset

  schema "buttons" do
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(button, attrs) do
    button
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
