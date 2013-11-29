defmodule Mix.Tasks.Import do
  use Mix.Task

  @shortdoc "Import items from a standard csv file"

  @moduledoc """
  Import items from a standard csv data file.
  """
  def run(_) do
    ScienceExplorerImporter.Repo.start_link
    stream = File.stream!("data/items1-utf8.csv")
    Enum.each stream, fn(line) ->
      item = ScienceExplorerImporter.Item.import_from_csv_string(line)
      ScienceExplorerImporter.Repo.create(item)
    end
  end
end
