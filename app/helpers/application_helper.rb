module ApplicationHelper
  def cover_for( book )
    covers = book.covers.with_indifferent_access
    covers[:small] || covers[:thumbnail] || covers[:medium] || covers.values.first
  end
end
