# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :play_throughs
end
