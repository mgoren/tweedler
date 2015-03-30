class TweedsController < ApplicationController

  def index
    @tweeds = Tweed.all
  end


  def new
    @tweed = Tweed.new
  end

  def create
    @tweed = current_user.tweeds.new(tweed_params)
    if @tweed.save
      flash[:notice] = "You Tweed Posted. Jolly Good!"
      redirect_to tweeds_path
    else
      flash[:error] = "Bloody hell."
      render :new
    end
  end


  private

    def tweed_params
      params.require(:tweed).permit(:body)
    end
end
