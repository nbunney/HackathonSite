class EventPolicy < ApplicationPolicy
  def create?
    user && user.admin?
  end
  alias_method :update?, :create?
  alias_method :destroy?, :create?

  class Scope < Scope
    def resolve
      scope
    end
  end
end
