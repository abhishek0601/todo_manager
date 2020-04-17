class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    session[:current_user_id] = user.id
    redirect_to todos_path
  end

  def validate
    check_user = User.where("email=? and password =?", params[:email], params[:password]).exists?
    render plain: check_user
  end

  def new
    render "users/new"
  end
end
