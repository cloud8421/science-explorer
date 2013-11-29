defmodule ScienceExplorerImporter.Items do
  import Ecto.Query

  alias ScienceExplorerImporter.Item
  alias ScienceExplorerImporter.Repo
  alias ScienceExplorerImporter.ItemsSerializer

  def all(limit // 50) do
    do_all(limit) |> ItemsSerializer.serialize_list
  end

  defp do_all(limit) do
    query = from item in Item,
            select: item
    Repo.all(from q in query, limit: limit)
  end
end
