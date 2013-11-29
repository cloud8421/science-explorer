defmodule ScienceExplorer.Item do
  use Ecto.Model

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
    field :collection, :string
  end

  def import_from_csv_string(csv_string) do
    data = CSV.parse(csv_string) |> List.flatten
    new(
      name: Enum.at(data, 1),
      title: Enum.at(data, 2),
      maker: Enum.at(data, 3),
      date_of_manufacturing: Enum.at(data, 4),
      place: Enum.at(data, 5),
      materials: Enum.at(data, 6),
      measurements: Enum.at(data, 7),
      description: Enum.at(data, 8),
      whole_part: Enum.at(data, 9),
      collection: Enum.at(data, 10)
    )
  end

end
