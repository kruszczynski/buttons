defmodule Buttons.Repo.Migrations.AddButtonsTable do
  use Ecto.Migration

  def change do
    create table("buttons") do
      add :label, :string

      timestamps()
    end
  end
end
