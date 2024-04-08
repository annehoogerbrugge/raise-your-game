# frozen_string_literal: true

module Api
  module V1
    class ImpactsController < ApplicationController
      def report
        @players = Player.all.sort_by { |player| player.total_impact }.reverse
        if @players.any?
          @players
        else
          render json: { message: "no players found", status: :not_found }
        end
      end
    end
  end
end

