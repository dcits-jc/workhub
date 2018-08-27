class Api::V1::ProjectsController < ApplicationController

  # 检索项目
  def search
    @projects = Project.search(params[:search])
    if @projects.present?
      render json: {
          stat: 1,
          data: @projects.map{ |project|
            {
              id: project.id,
              name: project.name,
              code: project.code,
              sales_name: project.sales.name,
              is_disabled: project.is_disabled
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
