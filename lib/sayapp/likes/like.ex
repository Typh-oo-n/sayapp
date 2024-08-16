defmodule Sayapp.Likes.Like do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sayapp.Accounts.User
  alias Sayapp.Posts.Post

  schema "likes" do
    # field :user_id, :id
    # field :post_id, :id
    belongs_to :user, User
    belongs_to :post, Post

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [:user_id, :post_id])
    |> validate_required([:user_id, :post_id])
  end

  def create_like(attrs \\ %{}) do
    %Sayapp.Likes.Like{}
    |> Like.changeset(attrs)
    |> Repo.insert()
  end

end
