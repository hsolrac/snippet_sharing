defmodule SnippetShareWeb.SnippetLive.Create do
  use SnippetShareWeb, :live_view
  import Phoenix.HTML.Form

  alias SnippetShare.{Snippets, Snippets.Snippet}

  def mount(_params, _session, socket) do
    socket = 
      assign(
        socket, 
        form: to_form(Snippets.change_snippet(%Snippet{}))
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <Layouts.app flash={@flash} current_scope={@current_scope}>
        <div class="flex items-center justify-center">
          <h1 class="font-brand font-bold text-3xl">Share snippet's code</h1>
        </div>

        <.form for={@form}>
          <div class="justify-center px-28 w-full space-y-4 mb-10">
            <.input field={@form[:description]} placeholder="Gist description.." autocomplete="off" />
            <div>
              <div class="flex p-1 items-center bg-emDark rounded-t-md border h-16">
                <div class="items-center w-[300px] mb-2">
                  <.input
                    field={@form[:name]}
                    placeholder="Filename including extension..."
                    autocomplete="off"
                  />
                </div>
              </div>
              <.input
                type="textarea"
                field={@form[:markup_text]}
                class="textarea w-full rounded-b-md"
                placeholder="Insert code..."
                spellcheck="false"
                autocomplete="off"
              />
            </div>
            <div class="flex justify-end">
              <.button class="create_button">Create gist</.button>
            </div>
          </div>
        </.form>
      </Layouts.app>
    """
  end
end
