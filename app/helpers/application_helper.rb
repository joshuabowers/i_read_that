module ApplicationHelper
  def cover_for( book )
    covers = book.covers.with_indifferent_access
    covers[:small] || covers[:thumbnail] || covers[:medium] || "http://covers.openlibrary.orb/b/isbn/#{book.isbn}-S.jpg"
  end
end
