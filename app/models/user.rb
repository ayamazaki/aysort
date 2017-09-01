class User < ApplicationRecord


scope :get_by_name, ->(name) {
where("name like ?", "%#{name}%")
}

scope :get_by_value1, ->(value1) {
where(value1: value1)
}

scope :get_by_value3, ->(value3) {
where("value3 like ?", "%#{value3}")
}


end
