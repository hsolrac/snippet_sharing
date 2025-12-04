# SnippetShare

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Service postgres with docker
```sh
    docker run --name snippet-db \
        -e POSTGRES_USER=snippet  \
        -e POSTGRES_PASSWORD=snippet \
        -e POSTGRES_DB=snippet_share_dev \
        -p 5432:5432 \
        -d postgres:16
```
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
