class UsersController < Clearance::UsersController

  def edit
    @user= current_user

  end


  def update
    @user = current_user
    @user.update(permit_params)

    redirect_to profile_path

    end


  def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    birthday = user_params.delete(:birthday)
    image = user_params.delete(:image)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.birthday = birthday
      user.image = image
  	end
    end

    def permit_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :birthday, {image: []})
  	end
  end