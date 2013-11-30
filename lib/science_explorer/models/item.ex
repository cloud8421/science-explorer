defmodule ScienceExplorer.Item do
  use Ecto.Model

  alias ScienceExplorer.CollectionsQueries
  alias ScienceExplorer.Repo

  validate item,
    name: present(),
    title: present()

  queryable "items" do
    field :name, :string
    field :title, :string
    field :maker, :string
    field :date_of_manufacturing, :string
    field :place, :string
    field :materials, :string
    field :measurements, :string
    field :description, :string
    field :whole_part, :string

    belongs_to :collection, ScienceExplorer.Collection
  end

  def import_from_csv_string(csv_string) do
    data = CSV.parse(csv_string) |> List.flatten
    collection = Enum.at(data, 10) |> CollectionsQueries.find_or_create_by_name
    item = new(
      name: Enum.at(data, 1),
      title: Enum.at(data, 2),
      maker: Enum.at(data, 3),
      date_of_manufacturing: Enum.at(data, 4),
      place: Enum.at(data, 5),
      materials: Enum.at(data, 6),
      measurements: Enum.at(data, 7),
      description: Enum.at(data, 8),
      whole_part: Enum.at(data, 9),
      collection_id: collection.id
    )
    Repo.create(item)
  end

end
