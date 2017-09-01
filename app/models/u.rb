class U < ApplicationRecord

enum gender: { unknown: 0, male: 1, female: 2, other: 9 }

	scope :get_by_name, ->(name) {
where("name like ?", "%#{name}%")
}


scope :get_by_gender, ->(gender) {
where(gender: gender)
}


end
