defmodule Sayapp.LikesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sayapp.Likes` context.
  """

  @doc """
  Generate a like.
  """
  def like_fixture(attrs \\ %{}) do
    {:ok, like} =
      attrs
<<<<<<< HEAD
      |> Enum.into(%{})
=======
      |> Enum.into(%{

      })
      |> Sayapp.Likes.create_like()

    like
  end

  @doc """
  Generate a like.
  """
  def like_fixture(attrs \\ %{}) do
    {:ok, like} =
      attrs
      |> Enum.into(%{
        likes_count: 42
      })
>>>>>>> d6b3269618b4ab0c1a9d4bf2ff6bd736c00e4ada
      |> Sayapp.Likes.create_like()

    like
  end
end
