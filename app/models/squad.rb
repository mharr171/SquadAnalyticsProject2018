class Squad < ApplicationRecord
  belongs_to :user
	has_many :players, dependent: :destroy
	has_many :squad_dnas, dependent: :destroy
end
