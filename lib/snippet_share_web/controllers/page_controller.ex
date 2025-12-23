defmodule SnippetShareWeb.PageController do
  use SnippetShareWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: "/create")
  end
end
