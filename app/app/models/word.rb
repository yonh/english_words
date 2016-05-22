class Word < ActiveRecord::Base
	has_many :meanings, dependent: :destroy

   	accepts_nested_attributes_for :meanings, allow_destroy: true


   	def meanings_s
   		self.meanings.map { |i| i.cn.to_s }.join(" , ")
   	end

	def default_values
		self.access_count = 0 if self.access_count==nil
		self.correct_count = 0 if self.correct_count==nil
		self.error_count = 0 if self.error_count==nil
	end

	before_save :default_values
end
