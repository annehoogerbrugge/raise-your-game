# frozen_string_literal: true

module WeekDates
  extend ActiveSupport::Concern

  included do
    # for now we only support weeks in 2024 :)
    def week_start(week_number)
      Date.commercial(2024, week_number, 1)
    end

    def week_end(week_number)
      Date.commercial(2024, week_number, 7)
    end
  end
end