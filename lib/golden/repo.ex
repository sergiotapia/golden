defmodule Golden.Repo do
  use Ecto.Repo,
    otp_app: :golden,
    adapter: Ecto.Adapters.Postgres
end
