# frozen_string_literal: true

module Api
  module V1
    class PlayThroughsController < ApplicationController
      before_action :set_play_through, only: :show
      before_action :set_player, only: :create

      def index
        @play_throughs = PlayThrough.all

        render json: @play_throughs
      end

      def show
        render json: @play_through
      end

      # creates a play_through belonging to the associated user
      # the spent_time needs to be an integer number (..representing the amount of seconds)
      def create
        @play_through = @player.play_throughs.build(play_through_params)
        
        if @play_through.save
          @play_through
        else
          render json: @play_through.errors, status: :unprocessable_entity
        end
      end

      private
        def set_play_through
          @play_through = PlayThrough.find(params[:id])
        end

        def set_player
          @player = Player.find(params[:player_id])
        end

        def play_through_params
          params.require(:play_through).permit(:score, :time_spent)
        end
    end
  end
end
