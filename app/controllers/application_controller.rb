class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def home
    render html: "Hello, world!"
  end
end
