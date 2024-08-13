defmodule Sayapp.Repo.Migrations.AddFieldsToLikesTable do
  use Ecto.Migration

  def change do
    alter table(:likes) do
      add :user_id, :integer
      add :post_id, :integer
    end
  end
end
