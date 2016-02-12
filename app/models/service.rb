class Service < ActiveRecord::Base
    belongs_to :category
    validates_presence_of :category_id
    self.per_page = 10
end
