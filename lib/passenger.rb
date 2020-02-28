require_relative 'csv_record'

module RideShare
  class Passenger < CsvRecord
    attr_reader :name, :phone_number, :trips

    def initialize(id:, name:, phone_number:, trips: nil)
    #def initialize(id:, name:, phone_number:, trips: [])
      super(id)

      @name = name
      @phone_number = phone_number
      @trips = trips || []
      #@trips = trips 
    end

    def add_trip(trip)
      @trips << trip
    end

    def net_expenditures
      total = 0
      return total if @trips == nil
      @trips.each do |trip|
        total += trip.cost.to_f
      end
      return total
    end

    def total_time_spent
      total = 0
      return total if @trips == nil
      @trips.each do |trip|
        total += trip.calculate_duration(trip.start_time, trip.end_time).to_f
      end
      return total
    end

    private

    def self.from_csv(record)
      return new(
        id: record[:id],
        name: record[:name],
        phone_number: record[:phone_num]
      )
    end
  end
end
