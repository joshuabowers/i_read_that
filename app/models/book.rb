class Book
  include Mongoid::Document
  field :title, type: String
  field :authors, type: Array
  field :isbn, type: String
  field :pages, type: Integer
  field :covers, type: Hash
  
  def self.google_books_search(query)
    GoogleBooks::API.search(query, api_key: google_books_api_key)
  end
  
  def self.create_from_google_books_search(query)
    google_books_search(query).map do |book|
      Book.find_or_create_by(
        title: book.title,
        authors: book.authors,
        isbn: book.isbn,
        pages: book.page_count,
        covers: book.covers
      )
    end
  end
  
  def self.google_books_api_key
    @@api_key ||= ENV['GOOGLE_BOOKS_API_KEY']
  end
end
