defmodule ScienceExplorerImporter.Item do
  use Ecto.Model

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
end
