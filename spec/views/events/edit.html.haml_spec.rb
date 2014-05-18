require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :type => "",
      :pages_read => 1,
      :rating => 1.5
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_type[name=?]", "event[type]"
      assert_select "input#event_pages_read[name=?]", "event[pages_read]"
      assert_select "input#event_rating[name=?]", "event[rating]"
    end
  end
end
