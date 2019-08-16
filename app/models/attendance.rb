class Attendance < ApplicationRecord

	belongs_to :user
	belongs_to :event

  after_create :new_attendance_email
  
	def new_attendance_email
    UserMailer.new_attendance_email(self).deliver_now
  end
end

