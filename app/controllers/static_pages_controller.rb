class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_person.microposts.build
      @feed_items = current_person.feed
#            @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def show
  	@users = User.all
  end

  def about
  end

  def contact
  end



end
