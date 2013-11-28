defmodule ScienceExplorerImporter.Repo.Migrations.CreateStatusEnum do
  use Ecto.Migration

  def up do
    """
    CREATE TYPE status AS ENUM ('whole', 'part');
    """
  end

  def down do
    """
    DROP TYPE status;
    """
  end
end
