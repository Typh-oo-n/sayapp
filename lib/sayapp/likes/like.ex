defmodule Sayapp.Likes.Like do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sayapp.Accounts.User
  alias Sayapp.Posts.Post


  schema "likes" do
    field :likes_count, :integer
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :post, Post, foreign_key: :post_id


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [:likes_count, :user_id, :post_id])
    |> validate_required([:likes_count, :user_id, :post_id])
  end
end
