defmodule SnippetShare.Repo do
  use Ecto.Repo,
    otp_app: :snippet_share,
    adapter: Ecto.Adapters.Postgres
end
