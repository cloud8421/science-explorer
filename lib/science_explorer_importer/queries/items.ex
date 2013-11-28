defmodule ScienceExplorerImporter.Items do
  import Ecto.Query

  alias ScienceExplorerImporter.Item
  alias ScienceExplorerImporter.Repo

  def all do
    query = from item in Item,
            select: item
    Repo.all(query)
  end
end
