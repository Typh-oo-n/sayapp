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
      |> Sayapp.Likes.create_like()

    like
  end
end
