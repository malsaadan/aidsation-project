class Request < ApplicationRecord
    belongs_to :user

    validates :title, :req_type, :description, presence: true
end
