require_relative 'csv_record'

module RideShare
  class Driver < CsvRecord
    attr_reader :name, :vin, :status, :trips

    def initialize(id:, name:, vin:, status:, trips: nil)
      super(id)

      raise ArgumentError.new("Invalid Status")

      @name = name
      @vin = vin
      @status = status
      @trips = trips || []
    end

    def total_revenue
      return 100
    end

    def average_rating
      return 5
    end

    private

    def self.from_csv(record)
      return new(
          id: record[:id],
          name: record[:name],
          vin: record[:vin],
          status: record[:status]
      )
    end
  end
end
