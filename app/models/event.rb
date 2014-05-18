class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type, type: String
  field :occurred_at, type: Time
  field :pages_read, type: Integer
  field :rating, type: Float
  field :book_id, type: Moped::BSON::ObjectId
  
  embedded_in :user
  
  def book
    Book.find(self.book_id)
  end
end
