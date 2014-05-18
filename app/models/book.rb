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
  
  def self.google_books_api_key
    @@api_key ||= ENV['GOOGLE_BOOKS_API_KEY']
  end
end
