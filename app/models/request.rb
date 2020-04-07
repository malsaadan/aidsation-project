class Request < ApplicationRecord
    belongs_to :user
    has_one :sponsorship

    validates :title, :req_type, :description, presence: true
    
end
