# frozen_string_literal: true

module Api
  module V1
    class SummariesController < ApplicationController
      include WeekDates
      
      # the week symmary gives the total of duration and score of players for a given week
      # the week can be added as week number, which will be used for a start and end date
      def weekly_summary
        start_date = week_start(summary_params[:week_number])
        end_date = week_end(summary_params[:week_number])
        @players = Player.totals(start_date, end_date, summary_params[:sort_by])
        
        if @players.any?
          @players
        else
          render json: { message: "no players found", status: :not_found }
        end
      end

      private

        def summary_params
          params.permit(:week_number, :sort_by)
        end
    end
  end
end
