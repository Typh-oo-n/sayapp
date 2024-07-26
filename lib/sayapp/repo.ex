defmodule Sayapp.Repo do
  use Ecto.Repo,
    otp_app: :sayapp,
    adapter: Ecto.Adapters.MyXQL
end
