defmodule ScienceExplorer.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def priv do
    app_dir(:science_explorer, "priv/repo")
  end

  def url, do: "ecto://#{pg_url}-#{Mix.env}#{pg_options(Mix.env)}"

  defp pg_url, do: System.get_env("POSTGRES_URL")

  defp pg_options(:dev), do: nil
  defp pg_options(:test), do: "?size=1&max_overflow=0"
end
