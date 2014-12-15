class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def destroy? 
    user.present? && can_moderate?
  end
end