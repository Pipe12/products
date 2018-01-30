class Category < ApplicationRecord
	has_many :unions
	has_many :products, through: :unions
end
