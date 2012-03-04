class PagesController < ApplicationController
  def index
    @scrobbles = Scrobble.limit(5)
    if current_user
      @citations = current_user.citations.limit(3)
      @citations_read = current_user.scrobbles.limit(3).collect { |s| s.citation }.compact
    else
      @citations = [] 
      @citations_read = []
    end
  end
end
