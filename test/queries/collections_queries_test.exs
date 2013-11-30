defmodule CollectionsQueriesTest do
  use ScienceExplorer.RepoTestCase, async: false
  alias ScienceExplorer.CollectionsQueries
  alias ScienceExplorer.Collection
  alias ScienceExplorer.Repo

  test "it creates a new collection by name" do
    count = CollectionsQueries.all |> Enum.count
    assert count == 0
    collection = CollectionsQueries.find_or_create_by_name("test")
    assert collection.name == "test"
    assert CollectionsQueries.all |> Enum.count == count + 1
  end

  test "it does not create a new collection if it exists" do
    collection = Collection.new(name: "test")
    Repo.create(collection)
    collection = CollectionsQueries.find_or_create_by_name("test")
    assert collection.name == "test"
    assert CollectionsQueries.all |> Enum.count == 1
  end

end
