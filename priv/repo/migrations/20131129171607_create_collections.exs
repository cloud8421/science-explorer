defmodule ScienceExplorer.Repo.Migrations.CreateCollections do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE collections (
      id serial,
      name text
    );
    """
  end

  def down do
    """
    DROP TABLE collections;
    """
  end
end
