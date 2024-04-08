# frozen_string_literal: true

module Api
  module V1
    class PlayersController < ApplicationController

      def create
        @player = Player.new(player_params)

        if @player.save
          @player
        else
          render json: {data: @player.errors, message: 'Player is not saved'}, status: :unprocessable_entity
        end
      end

      private
        def player_params
          params.require(:player).permit(:name)  
        end
    end
  end
end