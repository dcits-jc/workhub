module ActionView
  module Helpers
    class FormBuilder 
       def flatpickr_date_select(method, options = {}, html_options = {})
           default_placeholder_hash={:placeholder=>"选择开始日期"}
           placeholder_hash=default_placeholder_hash.merge(options)
           existing_date = @object.send(method)
           formatted_date = existing_date.to_time.strftime("%F") if existing_date.present?
           @template.content_tag(:div, :class => "input-group flatpicker_date_select") do
                text_field(method, :value => formatted_date, :class => "form-control flatpickr-input",:data=>{:input=>""}, :placeholder=>placeholder_hash[:placeholder]) +
                @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar", :data=>{:toggle=>"1"} ) ,:class => "input-group-addon")+
                @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-remove", :data=>{:clear=>"1"} ) ,:class => "input-group-addon")
          end
       end
     end
   end
end