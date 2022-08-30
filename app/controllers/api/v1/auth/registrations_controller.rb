# frozen_string_literal: true

class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # def create
  #   super
  # end

  # def update
  #   super
  # end

  # def destroy
  #   super
  # end

  private

  def sign_up_params
    params.except(:confirm_success_url).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:name, :nickname, :image)
  end
end
