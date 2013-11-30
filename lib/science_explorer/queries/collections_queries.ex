defmodule ScienceExplorer.CollectionsQueries do
  import Ecto.Query

  alias ScienceExplorer.Collection
  alias ScienceExplorer.Repo

  def all do
    query = from collection in Collection,
            select: collection
    Repo.all(from q in query)
  end

  def find_or_create_by_name(name) do
    query = from c in Collection,
            where: c.name == ^name
    collection = Repo.all(query)
    do_find_or_create_by_name(collection, name)
  end

  defp do_find_or_create_by_name([], name) do
    collection = Collection.new(name: name)
    Repo.create(collection)
  end

  defp do_find_or_create_by_name(collection, _), do: collection |> Enum.first

end
