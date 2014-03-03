class Question < ActiveRecord::Base
	validates_presence_of :text

	has_many :answers

	def include_many_answers?
		many_answers.equal?(true)
	end
end
