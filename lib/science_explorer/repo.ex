defmodule ScienceExplorer.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def priv do
    app_dir(:science_explorer_importer, "priv/repo")
  end

  def url, do: "ecto://#{pg_url}"

  defp pg_url, do: System.get_env("POSTGRES_URL")
end
