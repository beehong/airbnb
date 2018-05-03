class ReservationMailer < ApplicationMailer

	def booking_email(user, host, reservation_id)
		@user = user
		@host =host
		@reservation_id = reservation_id
		mail(to: @host.email, subject: 'Booking Confirmation')
	end
end