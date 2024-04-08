# frozen_string_literal: true

module CalculateTotals
  extend ActiveSupport::Concern

  class_methods do
    def totals(start_date, end_date, sort_by)
      sort = (sort_by.eql? "duration") ? "total_duration" : "total_score"
      Player.joins(:play_throughs)
        .where('play_throughs.created_at BETWEEN ? AND ?', start_date, end_date)
        .select("players.*, SUM(play_throughs.score) as total_score, SUM(play_throughs.time_spent) as total_duration")
        .group('players.id')
        .order("#{sort} DESC")
    end
  end
end