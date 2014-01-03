module ApplicationHelper
  def mark_required(object, attribute)  
    "<span class='help-inline' style='color: red;'>* required</span>".html_safe if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end

  def page_title(page_title, separator = " - ")
    page_title = I18n.t('title.layout.default') if page_title.blank?
    [I18n.t('title.layout.main'), page_title].compact.join(separator)
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def meta_data_tags
    object = instance_variable_get('@'+controller_name.singularize)
    meta = {}

    if object.kind_of? ActiveRecord::Base
      meta[:keywords] = object.meta_keywords if object[:meta_keywords].present?
      meta[:description] = object.meta_description if object[:meta_description].present?
    end

    if meta[:description].blank? && object.kind_of?(Resolution)
      meta[:description] = strip_tags(truncate(object.description, :length => 160, :separator => ' '))
    end

    meta.map do |name, content|
      tag('meta', :name => name, :content => content)
    end.join("\n")
  end

  def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-error", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, '&times;'.html_safe, class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end
end
