module Services
  module DateRangeService
    def missing_dates?
      start_date.nil? || end_date.nil?
    end

    def days_long
      (end_date - start_date).to_i
    end

    def date_range
      1 .. days_long
    end

    def length_array
      date_range.to_a
    end
  end
end