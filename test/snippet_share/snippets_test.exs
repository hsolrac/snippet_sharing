defmodule SnippetShare.SnippetsTest do
  use SnippetShare.DataCase

  alias SnippetShare.Snippets

  describe "snippets" do
    alias SnippetShare.Snippets.Snippet

    import SnippetShare.SnippetsFixtures

    @invalid_attrs %{name: nil, description: nil, markup_text: nil}

    test "list_snippets/0 returns all snippets" do
      snippet = snippet_fixture()
      assert Snippets.list_snippets() == [snippet]
    end

    test "get_snippet!/1 returns the snippet with given id" do
      snippet = snippet_fixture()
      assert Snippets.get_snippet!(snippet.id) == snippet
    end

    test "create_snippet/1 with valid data creates a snippet" do
      valid_attrs = %{name: "some name", description: "some description", markup_text: "some markup_text"}

      assert {:ok, %Snippet{} = snippet} = Snippets.create_snippet(valid_attrs)
      assert snippet.name == "some name"
      assert snippet.description == "some description"
      assert snippet.markup_text == "some markup_text"
    end

    test "create_snippet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Snippets.create_snippet(@invalid_attrs)
    end

    test "update_snippet/2 with valid data updates the snippet" do
      snippet = snippet_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", markup_text: "some updated markup_text"}

      assert {:ok, %Snippet{} = snippet} = Snippets.update_snippet(snippet, update_attrs)
      assert snippet.name == "some updated name"
      assert snippet.description == "some updated description"
      assert snippet.markup_text == "some updated markup_text"
    end

    test "update_snippet/2 with invalid data returns error changeset" do
      snippet = snippet_fixture()
      assert {:error, %Ecto.Changeset{}} = Snippets.update_snippet(snippet, @invalid_attrs)
      assert snippet == Snippets.get_snippet!(snippet.id)
    end

    test "delete_snippet/1 deletes the snippet" do
      snippet = snippet_fixture()
      assert {:ok, %Snippet{}} = Snippets.delete_snippet(snippet)
      assert_raise Ecto.NoResultsError, fn -> Snippets.get_snippet!(snippet.id) end
    end

    test "change_snippet/1 returns a snippet changeset" do
      snippet = snippet_fixture()
      assert %Ecto.Changeset{} = Snippets.change_snippet(snippet)
    end
  end

  describe "saved_snippets" do
    alias SnippetShare.Snippets.SavedSnipet

    import SnippetShare.SnippetsFixtures

    @invalid_attrs %{}

    test "list_saved_snippets/0 returns all saved_snippets" do
      saved_snipet = saved_snipet_fixture()
      assert Snippets.list_saved_snippets() == [saved_snipet]
    end

    test "get_saved_snipet!/1 returns the saved_snipet with given id" do
      saved_snipet = saved_snipet_fixture()
      assert Snippets.get_saved_snipet!(saved_snipet.id) == saved_snipet
    end

    test "create_saved_snipet/1 with valid data creates a saved_snipet" do
      valid_attrs = %{}

      assert {:ok, %SavedSnipet{} = saved_snipet} = Snippets.create_saved_snipet(valid_attrs)
    end

    test "create_saved_snipet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Snippets.create_saved_snipet(@invalid_attrs)
    end

    test "update_saved_snipet/2 with valid data updates the saved_snipet" do
      saved_snipet = saved_snipet_fixture()
      update_attrs = %{}

      assert {:ok, %SavedSnipet{} = saved_snipet} = Snippets.update_saved_snipet(saved_snipet, update_attrs)
    end

    test "update_saved_snipet/2 with invalid data returns error changeset" do
      saved_snipet = saved_snipet_fixture()
      assert {:error, %Ecto.Changeset{}} = Snippets.update_saved_snipet(saved_snipet, @invalid_attrs)
      assert saved_snipet == Snippets.get_saved_snipet!(saved_snipet.id)
    end

    test "delete_saved_snipet/1 deletes the saved_snipet" do
      saved_snipet = saved_snipet_fixture()
      assert {:ok, %SavedSnipet{}} = Snippets.delete_saved_snipet(saved_snipet)
      assert_raise Ecto.NoResultsError, fn -> Snippets.get_saved_snipet!(saved_snipet.id) end
    end

    test "change_saved_snipet/1 returns a saved_snipet changeset" do
      saved_snipet = saved_snipet_fixture()
      assert %Ecto.Changeset{} = Snippets.change_saved_snipet(saved_snipet)
    end
  end
end
