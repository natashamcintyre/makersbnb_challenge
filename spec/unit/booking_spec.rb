require 'booking'

describe 'Booking' do
  describe '.create' do
    it "creates a persistent data in the database" do
    space = Space.create(name: "Cottage")
    puts space.id
    booking = Booking.create(space_id: space.id, booked_date: '2021-02-01') #user_id = user.id
    puts booking
    expect(booking.space_id).to eq space.id
    expect(booking.booked_date).to eq(Date.new(2021,02,01))
    expect(booking.space).to eq space
  end
end 
end
