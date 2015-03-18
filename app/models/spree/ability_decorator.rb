class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    can [:admin, :index, :new, :create], Spree::Variant
    can [:admin, :index, :new, :create, :edit, :update], Spree::Task
  end
end

Spree::Ability.register_ability(AbilityDecorator)