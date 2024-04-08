# frozen_string_literal: true

module Api
  module V1
    class SummariesController < ApplicationController
      include WeekDates
      
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
