require 'spec_helper'

describe "books/show" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "Title",
      :authors => "",
      :isbn => "Isbn",
      :pages => 1,
      :covers => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(//)
    rendered.should match(/Isbn/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
