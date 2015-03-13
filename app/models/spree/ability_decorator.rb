class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    can [:admin, :index, :new, :create], Spree::Variant
  end
end

Spree::Ability.register_ability(AbilityDecorator)