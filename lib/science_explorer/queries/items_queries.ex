defmodule ScienceExplorer.ItemsQueries do
  import Ecto.Query

  alias ScienceExplorer.Item
  alias ScienceExplorer.Repo

  def all(limit // 50) do
    query = from item in Item,
            select: item,
            order_by: item.name
    get_from_repo(query, limit)
  end

  def by_name(name, limit // 50) do
    query = from item in Item,
            select: item,
            where: like(item.name, "%" <> ^name <> "%"),
            order_by: item.name
    get_from_repo(query, limit)
  end

  defp get_from_repo(query, limit) do
    Repo.all(from q in query, preload: [:collection], limit: limit)
  end
end
