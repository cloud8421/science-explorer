defmodule ScienceExplorerImporter.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  # url ecto://username:password@hostname/database
  def url, do: "ecto://cloud@localhost/science-explorer-items"
end
