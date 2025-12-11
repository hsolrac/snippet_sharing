defmodule SnippetShare.Snippets.SavedSnipet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_snippets" do

    belongs_to :user, SnippetShare.Accounts.User
    belongs_to :snippet, SnippetShare.Snippets.Snippet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_snipet, attrs) do
    saved_snipet
    |> cast(attrs, [:user_id, :gist_id])
    |> validate_required([:user_id, :snippet_id])
  end
end
