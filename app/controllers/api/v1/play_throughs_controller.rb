# frozen_string_literal: true

module Api
  module V1
    class PlayThroughsController < ApplicationController
      before_action :set_play_through, only: %i[ show ]
      before_action :set_player, only: :create

      # GET /play_throughs
      def index
        @play_throughs = PlayThrough.all

        render json: @play_throughs
      end

      # GET /play_throughs/1
      def show
        render json: @play_through
      end

      # POST /play_throughs
      def create
        @play_through = @player.play_throughs.build(play_through_params)
        
        if @play_through.save
          render json: @play_through, status: :created, message: "Play_through created!"
        else
          render json: @play_through.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_play_through
          @play_through = PlayThrough.find(params[:id])
        end

        def set_player
          @player = Player.find(params[:player_id])
        end

        # Only allow a list of trusted parameters through.
        def play_through_params
          params.require(:play_through).permit(:score, :time_spent)
        end
    end
  end
end
