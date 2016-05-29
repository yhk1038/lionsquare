class Posting < ActiveRecord::Base
    has_many :replies
    belongs_to :user
    belongs_to :board
    validates :title, presence: {message: "제목을 입력해주세요."}
end
