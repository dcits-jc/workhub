class Api::V1::TeamsController < ApiController

  # 检索团队
  def search
    @teams = Team.search(params[:search])
    if @teams.present?
      render json: {
          stat: 1,
          data: @teams.map{ |team|
            {
              id: team.id,
              name: team.name,
              description: team.description,
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
