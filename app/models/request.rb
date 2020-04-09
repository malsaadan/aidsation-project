class Request < ApplicationRecord
    belongs_to :user
    has_one :sponsorship

    validates :title, :req_type, :description, presence: true
    validates_inclusion_of  :req_type,   
         :in => %w( support trade )

end
