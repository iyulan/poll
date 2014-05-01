class Question < ActiveRecord::Base
	before_validation :set_code

	validates_presence_of :text, :title

	has_many :answers, dependent: :destroy
	accepts_nested_attributes_for :answers, allow_destroy: true

	def include_many_answers?
		many_answers.equal?(true)
	end

	def has_answer_for?(ip)
		UserAnswer.find_all_by_answer_id_and_user_ip(answers.map(&:id), ip).count > 0
	end

	def set_code
		self.code = SecureRandom.hex(4) if self.code.blank?
	end
end
