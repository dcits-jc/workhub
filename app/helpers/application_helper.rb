module ApplicationHelper

 # link_to 按钮动态 active
 def active_class(controller_name)
  # current_page?(controller: controller_name) ? "active" : ""
  controller.controller_name == controller_name ? "active" : ""
 end


end
