class Memo < ApplicationRecord
    validates :title, presence: true, length: { minimum: 2, maximum: 32 }
    validates :description, presence: true, length: { minimum: 2, maximum: 140 }
end
