require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "MyString",
      :authors => "",
      :isbn => "MyString",
      :pages => 1,
      :covers => ""
    ))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_path(@book), "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "input#book_authors[name=?]", "book[authors]"
      assert_select "input#book_isbn[name=?]", "book[isbn]"
      assert_select "input#book_pages[name=?]", "book[pages]"
      assert_select "input#book_covers[name=?]", "book[covers]"
    end
  end
end
