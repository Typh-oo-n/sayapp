defmodule SayappWeb.PostLive.Show do
  use SayappWeb, :live_view

  alias Sayapp.Posts
  alias Sayapp.Accounts
  alias Sayapp.Comments.Comment
<<<<<<< HEAD
=======
  alias Sayapp.Comments
  alias Sayapp.Likes.Like
  alias Sayapp.Likes
>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada


  @impl true
  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])

    {:ok,
     socket
     |> assign(:user, user)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
<<<<<<< HEAD
=======
    comments = Comments.get_comment_for_a_post(id)
       likes = Likes.get_likes_for_a_post(id)
>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, Posts.get_post!(id))
<<<<<<< HEAD
=======
     |> assign(:comments, comments )
     |> assign(:comment, %Comment{})
     |> assign(:likes, likes )
     |> assign(:like, %Like{})
  }
>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada

     |> assign(:comment, %Comment{})}
  end

  def handle_event("like", %{"post_id" => post_id}, socket) do
  user_id = socket.assigns.current_user.id

  case Sayapp.Likes.create_like(%{post_id: post_id, user_id: user_id}) do
    {:ok, _like} ->
      {:noreply, assign(socket, :post, Sayapp.Blog.get_post!(post_id))}
    {:error, _reason} ->
      {:noreply, socket}
  end
end


  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"
  defp page_title(:add_comment), do: "Add comment"
  defp page_title(:add_likes), do: "Add likes"
end
