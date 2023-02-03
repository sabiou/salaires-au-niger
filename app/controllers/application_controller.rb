class ApplicationController < ActionController::Base
  def hello
    render 'salaries/index'
  end
end