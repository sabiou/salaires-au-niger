class ApplicationController < ActionController::Base
  include Pagy::Backend
  def hello
    render 'salaries/index'
  end
end