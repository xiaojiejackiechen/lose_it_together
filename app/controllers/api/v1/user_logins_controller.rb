class Api::V1::UserLoginsController < Api::V1::GraphitiController
  def index
    user_logins = UserLoginResource.all(params)
    respond_with(user_logins)
  end

  def show
    user_login = UserLoginResource.find(params)
    respond_with(user_login)
  end

  def create
    user_login = UserLoginResource.build(params)

    if user_login.save
      render jsonapi: user_login, status: :created
    else
      render jsonapi_errors: user_login
    end
  end

  def update
    user_login = UserLoginResource.find(params)

    if user_login.update_attributes
      render jsonapi: user_login
    else
      render jsonapi_errors: user_login
    end
  end

  def destroy
    user_login = UserLoginResource.find(params)

    if user_login.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: user_login
    end
  end
end
