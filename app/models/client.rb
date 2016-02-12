class Client < ActiveRecord::Base
   validates_presence_of :name
   validates_presence_of :surname
   validates_presence_of :email 
   validates_presence_of :phone
   validates_uniqueness_of :email 
   validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
   self.per_page = 10
end
