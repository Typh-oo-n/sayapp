defmodule Sayapp.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sayapp.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        text: "some text"
      })
      |> Sayapp.Comments.create_comment()

    comment
  end
end
