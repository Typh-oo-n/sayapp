defmodule SayappWeb.PostLive.Show do
  use SayappWeb, :live_view

  alias Sayapp.Posts
  alias Sayapp.Accounts
  alias Sayapp.Comments.Comment


  @impl true
  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])

    {:ok,
     socket
     |> assign(:user, user)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, Posts.get_post!(id))

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
end
