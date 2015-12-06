class EvaluatorHompagesController < ApplicationController
  def index
    @users = User.all
    @templates = Template.all
  end
end
