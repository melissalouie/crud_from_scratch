class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]

  def index
    @updates = Update.order(:user)

  end

  def show
  end

  def new
    @update = Update.new
  end

  def create
    @update = Update.new(update_params)
    @update.likes = 0
    if @update.save
      flash[:notice] = "Status update successfully created."
      redirect_to update_path(@update)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @update.update(update_params)
      flash[:notice] = "Status update successfully updated."
      redirect_to update_path(@update)
    else
      render :edit
    end
  end

  def add_like
    @update = Update.find(params[:id])
    @update.likes += 1
    @update.save
    redirect_to root_path
  end

  def destroy
    @update.destroy
    flash[:notice] = "Status update deleted."
    redirect_to root_path
  end

  private

  def set_update
    @update = Update.find(params[:id])
  end

  def update_params
    params.require(:update).permit(:user, :status, :likes)
  end
end
