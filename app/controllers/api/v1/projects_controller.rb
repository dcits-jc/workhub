class Api::V1::ProjectsController < ApplicationController

  # 检索项目
  def search
    @projects = Project.search(params[:search])
    # 让被禁用的项目被排在后面
    @projects = @projects.order_by_not_disabled
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
