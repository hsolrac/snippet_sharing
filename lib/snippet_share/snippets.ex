defmodule SnippetShare.Snippets do
  @moduledoc """
  The Snippets context.
  """

  import Ecto.Query, warn: false
  alias SnippetShare.Repo

  alias SnippetShare.Snippets.Snippet

  @doc """
  Returns the list of snippets.

  ## Examples

      iex> list_snippets()
      [%Snippet{}, ...]

  """
  def list_snippets do
    Repo.all(Snippet)
  end

  @doc """
  Gets a single snippet.

  Raises `Ecto.NoResultsError` if the Snippet does not exist.

  ## Examples

      iex> get_snippet!(123)
      %Snippet{}

      iex> get_snippet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_snippet!(id), do: Repo.get!(Snippet, id)

  @doc """
  Creates a snippet.

  ## Examples

      iex> create_snippet(%{field: value})
      {:ok, %Snippet{}}

      iex> create_snippet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_snippet(user, attrs) do
    user
    |> Ecto.build_assoc(:snippets)
    |> Snippet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a snippet.

  ## Examples

      iex> update_snippet(snippet, %{field: new_value})
      {:ok, %Snippet{}}

      iex> update_snippet(snippet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_snippet(%Snippet{} = snippet, attrs) do
    snippet
    |> Snippet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a snippet.

  ## Examples

      iex> delete_snippet(snippet)
      {:ok, %Snippet{}}

      iex> delete_snippet(snippet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_snippet(%Snippet{} = snippet) do
    Repo.delete(snippet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking snippet changes.

  ## Examples

      iex> change_snippet(snippet)
      %Ecto.Changeset{data: %Snippet{}}

  """
  def change_snippet(%Snippet{} = snippet, attrs \\ %{}) do
    Snippet.changeset(snippet, attrs)
  end

  alias SnippetShare.Snippets.SavedSnipet

  @doc """
  Returns the list of saved_snippets.

  ## Examples

      iex> list_saved_snippets()
      [%SavedSnipet{}, ...]

  """
  def list_saved_snippets do
    Repo.all(SavedSnipet)
  end

  @doc """
  Gets a single saved_snipet.

  Raises `Ecto.NoResultsError` if the Saved snipet does not exist.

  ## Examples

      iex> get_saved_snipet!(123)
      %SavedSnipet{}

      iex> get_saved_snipet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saved_snipet!(id), do: Repo.get!(SavedSnipet, id)

  @doc """
  Creates a saved_snipet.

  ## Examples

      iex> create_saved_snipet(%{field: value})
      {:ok, %SavedSnipet{}}

      iex> create_saved_snipet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saved_snipet(user, attrs) do
    user
    |> Ecto.build_assoc(:saved_gists)
    |> SavedSnipet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saved_snipet.

  ## Examples

      iex> update_saved_snipet(saved_snipet, %{field: new_value})
      {:ok, %SavedSnipet{}}

      iex> update_saved_snipet(saved_snipet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saved_snipet(%SavedSnipet{} = saved_snipet, attrs) do
    saved_snipet
    |> SavedSnipet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saved_snipet.

  ## Examples

      iex> delete_saved_snipet(saved_snipet)
      {:ok, %SavedSnipet{}}

      iex> delete_saved_snipet(saved_snipet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saved_snipet(%SavedSnipet{} = saved_snipet) do
    Repo.delete(saved_snipet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saved_snipet changes.

  ## Examples

      iex> change_saved_snipet(saved_snipet)
      %Ecto.Changeset{data: %SavedSnipet{}}

  """
  def change_saved_snipet(%SavedSnipet{} = saved_snipet, attrs \\ %{}) do
    SavedSnipet.changeset(saved_snipet, attrs)
  end
end
