class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "Hey! New User has been created..."
    render plain: response_text
  end

  def validate
    check_user = User.where("email=? and password =?", params[:email], params[:password]).exists?
    render plain: check_user
  end
end
