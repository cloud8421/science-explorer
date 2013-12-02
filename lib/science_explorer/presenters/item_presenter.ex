defmodule ScienceExplorer.ItemPresenter do
  alias ScienceExplorer.Repo
  alias ScienceExplorer.Collection

  def wrap_list(list) do
    do_wrap_list(list)
  end

  def new(item) do
    [
      id: item.id,
      name: item.name,
      title: item.title,
      description: item.description,
      collection: associated_collection(item, item.collection.loaded?)
    ]
  end

  defp do_wrap_list(list) do
    Enum.map list, &new/1
  end

  defp associated_collection(item, true) do
    item.collection.get.name
  end
  defp associated_collection(item, false) do
    collection = Repo.get(Collection, item.collection_id)
    collection.name
  end
end
