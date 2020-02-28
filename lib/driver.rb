require_relative 'csv_record'

module RideShare
  class Driver < CsvRecord
    attr_accessor :vin, :status, :trips

    def initialize(id:, name:, vin:, status:, trips: [])
      super(id, name)
      @vin = vin
      @status = status
      @trips = trips
    end

    def self.from_csv(record)
      driver =  Driver.new(
        id: record[:id],
        name: record[:name],
        vin: record[:vin],
        status: record[:status].to_sym
      )
      return driver
    end
    
  end
end