class DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboards', only: [:index]

  def index
    @users = User.all
  end
end
