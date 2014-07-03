class Book
  include Mongoid::Document
  field :title, type: String
  field :authors, type: Array
  field :isbn, type: String
  field :pages, type: Integer
  field :covers, type: Hash
  field :preview_link, type: String
  
  has_and_belongs_to_many :read_by, class_name: 'User', inverse_of: :read_books
  has_and_belongs_to_many :currently_read_by, class_name: 'User', inverse_of: :currently_reading
    
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
        covers: book.covers,
        preview_link: book.preview_link
      )
    end
  end
  
  def self.google_books_api_key
    @@api_key ||= ENV['GOOGLE_BOOKS_API_KEY']
  end
end
