defmodule Sayapp.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :blog_id, references(:blogs, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:likes, [:blog_id])
    create index(:likes, [:user_id])
  end
end
