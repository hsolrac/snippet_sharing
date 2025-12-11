defmodule SnippetShare.SnippetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SnippetShare.Snippets` context.
  """

  @doc """
  Generate a snippet.
  """
  def snippet_fixture(attrs \\ %{}) do
    {:ok, snippet} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> SnippetShare.Snippets.create_snippet()

    snippet
  end

  @doc """
  Generate a saved_snipet.
  """
  def saved_snipet_fixture(attrs \\ %{}) do
    {:ok, saved_snipet} =
      attrs
      |> Enum.into(%{

      })
      |> SnippetShare.Snippets.create_saved_snipet()

    saved_snipet
  end
end
