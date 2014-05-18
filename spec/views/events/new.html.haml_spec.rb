require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :type => "",
      :pages_read => 1,
      :rating => 1.5
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_type[name=?]", "event[type]"
      assert_select "input#event_pages_read[name=?]", "event[pages_read]"
      assert_select "input#event_rating[name=?]", "event[rating]"
    end
  end
end
