require 'spec_helper'

describe "trips/show" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :name => "Name",
      :description => "MyText",
      :image_name => "Image Name",
      :slug => "Slug",
      :tag_line => "Tag Line",
      :price => 1.5,
      :location => "Location",
      :activity => "Activity"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Image Name/)
    rendered.should match(/Slug/)
    rendered.should match(/Tag Line/)
    rendered.should match(/1.5/)
    rendered.should match(/Location/)
    rendered.should match(/Activity/)
  end
end
