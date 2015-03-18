module Spree
  class Task < Spree::Base
    belongs_to :user

    validates :name, presence: true
  end
end