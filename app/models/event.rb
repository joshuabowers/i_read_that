class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type, type: String
  field :occurred_at, type: Time
  field :pages_read, type: Integer
  field :rating, type: Float
  
  embedded_in :user
end
