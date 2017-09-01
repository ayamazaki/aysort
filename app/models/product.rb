class Product < ApplicationRecord

scope :get_by_name, ->(name) {
where("name like ?", "%#{name}%")
}

enum price: { unknown: 0, male: 1, female: 2, other: 9 }

end
