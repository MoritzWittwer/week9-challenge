class PagesController < ApplicationController
  before_action :hidden_activities
  # before_action :set_activity, only: %i[show]

  def show
    random_page

    # hidden_articles unless @location == 19 # TODO: how do i hide articles on a specific location id
  end

  def random_page
    @location = Location.all.sample
  end

  def hidden_articles
    @hide_articles = true
  end

  def hidden_activities
    @hide_activities = true
  end

  # def set_activity
  #   @activity = Activity.first
  # end
end
