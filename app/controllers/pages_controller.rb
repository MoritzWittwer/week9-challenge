class PagesController < ApplicationController
  # before_action :hidden_activities
  # before_action :hidden_location_activities
  # before_action :hidden_articles # hides the original articles from the moroika Page
  # before_action :set_activity, only: %i[show]

  def show
    # random_page #shows a random Page without articles
    redirect_to location_path(Location.ids.sample) # redirects to a random location
  end

  private

  def random_page
    @location = Location.all.sample
  end

  # def hidden_articles
  #   @hide_articles = true
  # end

  # def hidden_activities
  #   @hide_activities = true
  # end

  # def hidden_location_activities
  #   @hide_location_activities = true
  # end
end
