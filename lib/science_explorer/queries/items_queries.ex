defmodule ScienceExplorer.ItemsQueries do
  import Ecto.Query

  alias ScienceExplorer.Item
  alias ScienceExplorer.Repo
  alias ScienceExplorer.ItemsSerializer

  def all(limit // 50) do
    do_all(limit) |> ItemsSerializer.serialize_list
  end

  defp do_all(limit) do
    query = from item in Item,
            select: item
    Repo.all(from q in query, limit: limit)
  end
end
