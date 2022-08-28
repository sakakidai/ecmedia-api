class Api::V1::Auth::PasswordsController < DeviseTokenAuth::PasswordsController

  # パスワードリセットのメールを送信
  def create
    super
  end

  # パスワードの変更
  def update
    super
  end

  # パスワードリセットメールのリンクをクリックしたときの処理
  # DeviseTokenAuth::PasswordsController#editをコピーして
  # redirect_toの引数にallow_other_host: trueを追加
  def edit
    # if a user is not found, return nil
    @resource = resource_class.with_reset_password_token(resource_params[:reset_password_token])

    if @resource && @resource.reset_password_period_valid?
      token = @resource.create_token unless require_client_password_reset_token?

      # ensure that user is confirmed
      @resource.skip_confirmation! if confirmable_enabled? && !@resource.confirmed_at
      # allow user to change password once without current_password
      @resource.allow_password_change = true if recoverable_enabled?

      @resource.save!

      yield @resource if block_given?

      if require_client_password_reset_token?
        redirect_to DeviseTokenAuth::Url.generate(@redirect_url, reset_password_token: resource_params[:reset_password_token])
      else
        redirect_header_options = { reset_password: true }
        redirect_headers = build_redirect_headers(token.token,
                                                  token.client,
                                                  redirect_header_options)
        redirect_to(@resource.build_auth_url(@redirect_url,
                                             redirect_headers), allow_other_host: true)
      end
    else
      render_edit_error
    end
  end

  private

  def resource_params
    params.except(:redirect_url).permit(:email, :reset_password_token)
  end
end