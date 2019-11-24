defmodule Buttons.Repo do
  use Ecto.Repo,
    otp_app: :buttons,
    adapter: Ecto.Adapters.Postgres
end
