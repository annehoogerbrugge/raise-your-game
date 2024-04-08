# frozen_string_literal: true

class PlayThrough < ApplicationRecord
  belongs_to :player

  validates :score, presence: true
  validates :time_spent, presence: true
end
