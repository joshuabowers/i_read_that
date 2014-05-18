require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :authors => "",
      :isbn => "MyString",
      :pages => 1,
      :covers => ""
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "input#book_authors[name=?]", "book[authors]"
      assert_select "input#book_isbn[name=?]", "book[isbn]"
      assert_select "input#book_pages[name=?]", "book[pages]"
      assert_select "input#book_covers[name=?]", "book[covers]"
    end
  end
end
