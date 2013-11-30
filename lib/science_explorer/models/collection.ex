defmodule ScienceExplorer.Collection do
  use Ecto.Model

  validate collection,
    name: present()

  queryable "collections" do
    field :name, :string
    has_many :items, ScienceExplorer.Item
  end

end
