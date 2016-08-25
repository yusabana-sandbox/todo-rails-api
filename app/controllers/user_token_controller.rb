class UserTokenController < Knock::AuthTokenController
  # Knock::AuthTokenControllerで設定されているbefore_actionを無効化して、
  # ユーザが存在しなければ作り、存在すれば認証する仕組みとする
  skip_before_action :authenticate

  def create
    if entity.present?
      authenticate
      render json: auth_token, status: :created
    else
      user = User.new(auth_params)
      if user.save
        authenticate
        render json: auth_token, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end
  end

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end
