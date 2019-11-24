# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Buttons.Repo.insert!(%Buttons.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
["Button", "Beton", "Close the window"]
|> Enum.map(&(%Buttons.Button{label: &1}))
|> Enum.each(&(Buttons.Repo.insert!(&1)))
