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
      respond_to do |format|
        format.html do
          flash[:notice] = "You Tweed Posted. Jolly Good!"
          redirect_to tweeds_path
        end
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = "Bloody hell."
          render :new
        end
        format.js { render js: "alert('fail');" }
      end
    end
  end

  def destroy
    @tweed = Tweed.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to tweeds_path }
      format.js
    end
  end

  private

    def tweed_params
      params.require(:tweed).permit(:body)
    end
end
