defmodule ItemPresenterTest do
  use ScienceExplorer.RepoTestCase, async: false
  alias ScienceExplorer.Repo
  alias ScienceExplorer.Item
  alias ScienceExplorer.Collection
  alias ScienceExplorer.ItemPresenter

  test "it wraps an item" do
    collection = Collection.new(name: "Clocks") |> Repo.create
    item = Item.new(
      name: "Pocket Watch",
      title: "Pocket sundial watch",
      description: "You can check the time with it",
      collection_id: collection.id
    )
    item = Repo.create(item)
    presented_item = ItemPresenter.new(item)
    assert presented_item == [
      id: item.id,
      original_id: item.original_id,
      name: "Pocket Watch",
      title: "Pocket sundial watch",
      maker: nil,
      date_of_manufacturing: nil,
      place: nil,
      materials: nil,
      measurements: nil,
      description: "You can check the time with it",
      status: nil,
      collection: "Clocks"
    ]
  end
end
