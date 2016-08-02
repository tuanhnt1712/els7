class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.activities.paginate page: params[:page],
        per_page: Settings.activity_per_page
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
