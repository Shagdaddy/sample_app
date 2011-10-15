class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

  def email
    @title = "View Email Queue"
  end

  def emailCQ
	@title = "Clear Email Queue"
  end

end
