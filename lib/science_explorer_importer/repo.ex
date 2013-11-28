defmodule ScienceExplorerImporter.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def priv do
    app_dir(:science_explorer_importer, "priv/repo")
  end

  def url, do: "ecto://cloud@localhost/science-explorer-items"
end
