class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_mi!

  def show
      @users = User.all.order(:email)
  end

  def update
    id = params[:id]
    @user = User.find(id.to_i)
    @user.is_admin = !@user.is_admin
    @user.save!
    redirect_to users_list_path
  end

  private

  def admin_mi!
    flash[:danger] = "Bu sayfaya Erişemezsin..."
    redirect_to(root_path) unless current_user.is_admin
  end
end
