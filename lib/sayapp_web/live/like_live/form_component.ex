defmodule SayappWeb.LikeLive.FormComponent do
  use SayappWeb, :live_component

  alias Sayapp.Likes

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage like records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="like-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
<<<<<<< HEAD
=======
        <.input field={@form[:user_id]} type="hidden" value={@user.id} />
        <.input field={@form[:post_id]} type="hidden" value={@post.id} />
        <.input field={@form[:likes_count]} type="number" label="Likes count" />
>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada
        <:actions>
          <.button phx-disable-with="Saving...">Save Like</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{like: like} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Likes.change_like(like))
     end)}
  end

  @impl true
  def handle_event("validate", %{"like" => like_params}, socket) do
    changeset = Likes.change_like(socket.assigns.like, like_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"like" => like_params}, socket) do
    save_like(socket, socket.assigns.action, like_params)
  end

  defp save_like(socket, :edit, like_params) do
    case Likes.update_like(socket.assigns.like, like_params) do
      {:ok, like} ->
        notify_parent({:saved, like})

        {:noreply,
         socket
         |> put_flash(:info, "Like updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_like(socket, :new, like_params) do
    case Likes.create_like(like_params) do
      {:ok, like} ->
        notify_parent({:saved, like})

        {:noreply,
         socket
         |> put_flash(:info, "Like created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

<<<<<<< HEAD
=======
  defp save_like(socket, :add_likes, like_params) do
    case Likes.create_like(like_params) do
      {:ok, like} ->
        notify_parent({:saved, like})

        {:noreply,
         socket
         |> put_flash(:info, "Like created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada
  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
