class UserAnswer < ActiveRecord::Base
	validates_presence_of :user_ip
	validates_uniqueness_of :answer_id, scope: :user_ip

	belongs_to :answer
end
