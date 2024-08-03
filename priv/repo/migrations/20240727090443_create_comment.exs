defmodule Sayapp.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comment) do
      add :text, :string

      timestamps(type: :utc_datetime)
    end
  end
end
