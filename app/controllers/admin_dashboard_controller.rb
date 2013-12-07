class AdminDashboardController < ApplicationController
  before_action :authenticate_admin!

  def index

  end

  def new_admin
    @admin = Admin.new
  end

  def create_admin
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to :admin_dashboard
    else
      render 'new_admin'
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
