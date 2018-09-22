module ApplicationHelper

  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end

  def authorize_admin
    current_user.admin?
  end

  def autorize_teacher
    current_user.teacher?
  end
  
end
