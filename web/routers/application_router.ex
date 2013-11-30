defmodule ApplicationRouter do
  use Dynamo.Router
  alias ScienceExplorer.ItemsQueries

  filter JSON.Dynamo.Filter

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html", items: ItemsQueries.all
  end

  get "/items" do
    conn.put_private :result_object, ItemsQueries.all
  end

end
