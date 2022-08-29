class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  def create
    super
  end

  def destroy
    super
  end

  private

  def resource_params
    params.permit(:email, :password)
  end
end
