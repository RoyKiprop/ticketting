defmodule Ticketting.Repo do
  use Ecto.Repo,
    otp_app: :ticketting,
    adapter: Ecto.Adapters.Postgres
end
