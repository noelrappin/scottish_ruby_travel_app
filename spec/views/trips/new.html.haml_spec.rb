require 'spec_helper'

describe "trips/new" do
  before(:each) do
    assign(:trip, stub_model(Trip,
      :name => "MyString",
      :description => "MyText",
      :image_name => "MyString",
      :slug => "MyString",
      :tag_line => "MyString",
      :price => 1.5,
      :location => "MyString",
      :activity => "MyString"
    ).as_new_record)
  end

  it "renders new trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trips_path, :method => "post" do
      assert_select "input#trip_name", :name => "trip[name]"
      assert_select "textarea#trip_description", :name => "trip[description]"
      assert_select "input#trip_image_name", :name => "trip[image_name]"
      assert_select "input#trip_slug", :name => "trip[slug]"
      assert_select "input#trip_tag_line", :name => "trip[tag_line]"
      assert_select "input#trip_price", :name => "trip[price]"
      assert_select "input#trip_location", :name => "trip[location]"
      assert_select "input#trip_activity", :name => "trip[activity]"
    end
  end
end
