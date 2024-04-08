# frozen_string_literal: true

class Player < ApplicationRecord
  include CalculateTotals

  has_many :play_throughs

  validates :name, uniqueness: true

  def total_impact
    return 0 if play_throughs.empty?
    best_score = play_throughs.maximum(:score) 
    first_score = play_throughs.order('created_at asc').first&.score
    best_score - first_score
  end
end
