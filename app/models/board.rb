class Board < ActiveRecord::Base
    has_many :postings
    belongs_to :category
end
