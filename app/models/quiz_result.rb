class QuizResult < ApplicationRecord
  belongs_to :notification_id, foreign_key: :notification_id, class_name: "Notification"
  serialize :options, Array

end
