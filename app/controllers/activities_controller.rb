class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]
  before_action :hidden_articles
  before_action :hidden
  before_action :hidden_activities, only: %i[index]
  before_action :hidden_location_activities

  def index
    @activities = Activity.all.order('location_id asc') # order is used to order the activites by the location_id (ascending or descending ) maybe its better to use created_at?
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

  def set_activity_title
    @activity = Activity.find(params[:id].title)
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

  def hidden_activities
    @hide_activities = true
  end

  def hidden_location_activities
    @hide_location_activities = true
  end
end
