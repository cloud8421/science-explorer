defmodule Mix.Tasks.Import do
  use Mix.Task

  @shortdoc "Import items from csv files."

  @moduledoc """
  Import items from a set of utf8 converted files.
  Files need to be placed in data/ AFTER being converted to utf8.
  Every csv file needs to be named as: items1-utf8.csv, items2-utf8.csv
  """
  def run(_) do
    ScienceExplorer.Repo.start_link
    Enum.map 1..4, fn(index) ->
      file = "data/items" <> to_string(index) <> "-utf8.csv"
      stream = File.stream!(file)
      Enum.each stream, fn(line) ->
        ScienceExplorer.Item.import_from_csv_string(line)
      end
    end
  end
end
