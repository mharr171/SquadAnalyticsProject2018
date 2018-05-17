class WelcomeController < ApplicationController
  def index
		@feedback = Feedback.new
  end
end
