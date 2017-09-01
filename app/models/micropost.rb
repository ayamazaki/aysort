class Micropost < ApplicationRecord
  belongs_to :person

scope :get_by_question, ->(question) {
where("question like ?", "%#{question}%")
}

scope :get_by_result, ->(result) {
where(value1: result)
}

scope :get_by_succession, ->(succession) {
where("value3 like ?", "%#{succession}")
}

scope :get_by_value5, ->(value3) {
where("value3 like ?", "%#{value3}")
}


end
