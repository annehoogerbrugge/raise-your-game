class PlayThroughsController < ApplicationController
  before_action :set_play_through, only: %i[ show update destroy ]

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
    @play_through = PlayThrough.new(play_through_params)

    if @play_through.save
      render json: @play_through, status: :created, location: @play_through
    else
      render json: @play_through.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /play_throughs/1
  def update
    if @play_through.update(play_through_params)
      render json: @play_through
    else
      render json: @play_through.errors, status: :unprocessable_entity
    end
  end

  # DELETE /play_throughs/1
  def destroy
    @play_through.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play_through
      @play_through = PlayThrough.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def play_through_params
      params.require(:play_through).permit(:score, :time_spent)
    end
end
