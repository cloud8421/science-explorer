defmodule ScienceExplorer.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE items (
      id serial,
      name text,
      title text,
      maker text,
      date_of_manufacturing text,
      place text,
      materials text,
      measurements text,
      description text,
      whole_part text,
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
