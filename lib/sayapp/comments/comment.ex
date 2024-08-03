defmodule Sayapp.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sayapp.Accounts.User
  alias Sayapp.Posts.Post

  schema "comment" do
    field :text, :string
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :post, Post, foreign_key: :post_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:text, :post_id, :user_id])
    |> validate_required([:text, :post_id, :user_id])
  end
end
