defmodule ScienceExplorerImporter.ItemsSerializer do
  def serialize_list(list) do
    do_serialize_list(list)
  end

  defp do_serialize_list([]), do: []
  defp do_serialize_list(list) do
    Enum.map list, &serialize_item/1
  end

  defp serialize_item(item) do
    [
      id: item.id,
      name: item.name,
      title: item.title,
      description: item.description
    ]
  end
end
