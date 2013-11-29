defmodule ItemTest do
  use ExUnit.Case, async: true
  alias ScienceExplorerImporter.Item

  test "it validates presence of name" do
    assert Item.validate(Item.Entity[]) == [name: "can't be blank", title: "can't be blank"]
  end

  test "it imports from a csv string" do
    csv_data = """
    1974-100,Pocket horizontal sundial,Ansonia Sunwatch (pocket compass dial),Ansonia Clock Co.,1922-1939,"New York county, New York state, United States",,,Ansonia Sunwatch (pocket compass dial),WHOLE,SCM - Time Measurement
    """
    user = Item.import_from_csv_string(csv_data)
    assert user.name == "Pocket horizontal sundial"
    assert user.title == "Ansonia Sunwatch (pocket compass dial)"
    assert user.maker == "Ansonia Clock Co."
    assert user.date_of_manufacturing == "1922-1939"
    assert user.place == "New York county, New York state, United States"
    assert user.materials == ""
    assert user.measurements == ""
    assert user.description == "Ansonia Sunwatch (pocket compass dial)"
    assert user.whole_part == "WHOLE"
    assert user.collection == "SCM - Time Measurement"
  end

end
