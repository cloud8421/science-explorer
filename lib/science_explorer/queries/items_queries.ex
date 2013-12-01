defmodule ScienceExplorer.ItemsQueries do
  import Ecto.Query

  alias ScienceExplorer.Item
  alias ScienceExplorer.Repo

  def all(limit // 50) do
    do_all(limit)
  end

  defp do_all(limit) do
    query = from item in Item,
            select: item
    Repo.all(from q in query, preload: [:collection], limit: limit)
  end
end
