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

  # markdown: takes some text as an argument and returns the HTML 
  # result of reading that text as Markdown. <%= markdown(text) %>
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe 
  end


  def vote_link_classes(post, direction)
    if direction == 'up'
      "glyphicon " + 
      "glyphicon-chevron-up " + 
      "#{(current_user.voted(post)) && current_user.voted(post).up_vote? ? 'voted' : ''} "
    else   
      "glyphicon " + 
      "glyphicon-chevron-down " + 
      "#{(current_user.voted(post)) && current_user.voted(post).down_vote? ? 'voted' : ''} "
    end

  end
end
