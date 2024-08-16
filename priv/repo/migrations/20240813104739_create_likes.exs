defmodule Sayapp.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :likes_count, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
