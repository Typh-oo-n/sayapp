cleadefmodule Sayapp.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sayapp.Accounts.User
  alias Sayapp.Comments.Comment

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, User, foreign_key: :user_id
    has_many :comments, Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
