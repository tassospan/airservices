class Category < ActiveRecord::Base
    has_many :services, -> { order('price DESC') }
end
