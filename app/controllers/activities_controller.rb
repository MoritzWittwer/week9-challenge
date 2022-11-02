class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]
  before_action :hidden_articles
  before_action :hidden

  def index
    @activities = Activity.all
  end

  def show; end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity), notice: 'Activity successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: 'Activity was succesfully updated'
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_url, notice: 'Activitiy was successfully destroyed', status: :see_other
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :image, :location_id)
  end

  def hidden
    @hide_header = true
    @hide_poster = true
    @hide_description = true
  end

  def hidden_articles
    @hide_articles = true
  end
end
