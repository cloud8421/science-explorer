defmodule ScienceExplorerImporter.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE items (
      id serial,
      name text,
      title text,
      maker text,
      date_of_manufacturing date,
      place text,
      materials text,
      measurements text,
      description text,
      whole_part status,
      collection text
    );
    """
  end

  def down do
    """
    DROP TABLE items;
    """
  end
end
