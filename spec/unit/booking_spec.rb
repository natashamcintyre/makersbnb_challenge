require 'booking'

describe 'Booking' do
  describe '.create' do
    space = Space.create(name: "Cottage")
    booking = Booking.create(space_id: space.id, date: 2021-02-01) #user_id = user.id
    expect(booking.space_id).to eq space.id
    expect(booking.date).to eq 2021-02-01
    expect(booking.space).to eq space
  end
end
