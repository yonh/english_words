class Word < ActiveRecord::Base
	has_many :meanings, dependent: :destroy

   	accepts_nested_attributes_for :meanings, allow_destroy: true

	before_save :default_values
	def default_values
		self.access_count = 0
		self.correct_count = 0
		self.error_count = 0
	end
end
