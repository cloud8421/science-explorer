defmodule ScienceExplorer.ItemPresenter do
  alias ScienceExplorer.Repo
  alias ScienceExplorer.Collection

  def wrap_list(list) do
    do_wrap_list(list)
  end

  def new(item) do
    [
      id: item.id,
      original_id: item.original_id,
      name: item.name,
      title: item.title,
      maker: item.maker,
      date_of_manufacturing: item.date_of_manufacturing,
      place: item.place,
      materials: item.materials,
      measurements: item.measurements,
      description: item.description,
      status: item.whole_part,
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
