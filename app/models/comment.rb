class Comment < ApplicationRecord
  belongs_to :record, polymorphic: true
  has_one :response
end
