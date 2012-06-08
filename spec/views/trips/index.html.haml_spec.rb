require 'spec_helper'

describe "trips/index" do
  before(:each) do
    assign(:trips, [
      stub_model(Trip,
        :name => "Name",
        :description => "MyText",
        :image_name => "Image Name",
        :slug => "Slug",
        :tag_line => "Tag Line",
        :price => 1.5,
        :location => "Location",
        :activity => "Activity"
      ),
      stub_model(Trip,
        :name => "Name",
        :description => "MyText",
        :image_name => "Image Name",
        :slug => "Slug",
        :tag_line => "Tag Line",
        :price => 1.5,
        :location => "Location",
        :activity => "Activity"
      )
    ])
  end

  it "renders a list of trips" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Tag Line".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
  end
end
