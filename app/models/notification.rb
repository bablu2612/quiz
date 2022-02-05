class Notification < ApplicationRecord
    has_many :quiz_results, dependent: :destroy

end
