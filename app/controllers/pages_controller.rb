class PagesController < ApplicationController
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
end
