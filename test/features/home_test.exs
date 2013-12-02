# Feature tests go through the Dynamo.under_test
# and are meant to test the full stack.
defmodule HomeTest do
  use ScienceExplorer.RepoTestCase, async: false
  use Dynamo.HTTP.Case
  alias ScienceExplorer.Repo
  alias ScienceExplorer.Item
  alias ScienceExplorer.Collection

  test "returns OK" do
    conn = get("/")
    assert conn.status == 200
  end

  test "shows items on the home page" do
    collection = Collection.new(name: "Clocks")
    collection = Repo.create(collection)
    item = Item.new(name: "A wonderful clock", collection_id: collection.id)
    Repo.create(item)
    conn = get("/")
    assert Regex.match?(%r/A wonderful clock/, conn.sent_body)
  end
end
