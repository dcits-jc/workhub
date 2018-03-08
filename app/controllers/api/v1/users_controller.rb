class Api::V1::UsersController < ApiController

  # 检索用户
  def search
    @users = User.search(params[:search])
    if @users.present?
      render json: {
          stat: 1,
          data: @users.map{ |user|
            {
              id: user.id,
              code: user.code,
              name: user.name
            }
          }
        }  
    else
      render json: {
        stat: 0,
        data: []
      }  
    end
  end


end
