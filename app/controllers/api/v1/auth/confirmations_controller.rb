class Api::V1::Auth::ConfirmationsController < DeviseTokenAuth::ConfirmationsController

  # DeviseTokenAuth::ConfirmationsController#showをコピーして
  # redirect_toの引数にallow_other_host: trueを追加
  def show
    @resource = resource_class.confirm_by_token(resource_params[:confirmation_token])
    
    if @resource.errors.empty?
      yield @resource if block_given?

      redirect_header_options = { account_confirmation_success: true }

      if signed_in?(resource_name)
        token = signed_in_resource.create_token
        signed_in_resource.save!

        redirect_headers = build_redirect_headers(token.token,
                                                  token.client,
                                                  redirect_header_options)

        redirect_to_link = signed_in_resource.build_auth_url(redirect_url, redirect_headers)
      else
        redirect_to_link = DeviseTokenAuth::Url.generate(redirect_url, redirect_header_options)
     end

      redirect_to(redirect_to_link, allow_other_host: true)
    else
      raise ActionController::RoutingError, 'Not Found'
    end
  end

  private

  def resource_params
    params.permit(:email, :confirmation_token, :config_name, :redirect_url)
  end
end