defmodule SnippetShare.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :markup_text, :text
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :snippet_id, references(:snippets, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:comments, [:user_id])
    create index(:comments, [:snippet_id])
  end
end
