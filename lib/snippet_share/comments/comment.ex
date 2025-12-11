defmodule SnippetShare.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :markup_text, :string
    belongs_to :user, SnippetShare.Accounts.User
    has_many  :comments, SnippetShare.Comments.Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:markup_text, :user_id, :snippet_id])
    |> validate_required([:markup_text, :user_id, :snippet_id])
  end
end
