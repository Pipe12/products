class Product < ApplicationRecord
	has_many :unions
	has_many :categories, through: :unions
end
