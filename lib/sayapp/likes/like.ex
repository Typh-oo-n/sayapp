defmodule Sayapp.Likes.Like do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sayapp.Accounts.User
  alias Sayapp.Posts.Post

<<<<<<< HEAD
  schema "likes" do
    # field :user_id, :id
    # field :post_id, :id
    belongs_to :user, User
    belongs_to :post, Post
=======

  schema "likes" do
    field :likes_count, :integer
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :post, Post, foreign_key: :post_id

>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(like, attrs) do
    like
<<<<<<< HEAD
    |> cast(attrs, [:user_id, :post_id])
    |> validate_required([:user_id, :post_id])
  end

  def create_like(attrs \\ %{}) do
    %Sayapp.Likes.Like{}
    |> Like.changeset(attrs)
    |> Repo.insert()
  end

=======
    |> cast(attrs, [:likes_count, :user_id, :post_id])
    |> validate_required([:likes_count, :user_id, :post_id])
  end
>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada
end
