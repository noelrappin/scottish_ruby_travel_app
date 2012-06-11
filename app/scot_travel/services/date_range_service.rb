module Services
  module DateRangeService
    def missing_dates?
      start_date.nil? || end_date.nil?
    end
  end
end