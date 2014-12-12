module ApplicationHelper
  # good for truly global functionality as helpers are avilable in all views.
  # for page-specifig code, use another way!!

  #  The 1st argument is an array of errors, and the 2nd is a block
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
end
