class Admin::DashboardController < ApplicationController
  include HttpAuthConcern

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  def show
  end
end
