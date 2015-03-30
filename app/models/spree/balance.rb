module Spree
  class Balance < Spree::Base
    belongs_to :user
    def self.amount_list
      [[50, 50], [200, 200], [500, 500], [1000, 1000], [3000, 3000]]
    end
    def self.billing_list
      [['ATM', 'atm'], ['信用卡', 'credit'], ['超商', 'cvs']]
    end
    def self.calculate_list
      {atm:0, credit:0, cvs:30}
    end
    def self.allpay_list
      {atm: 'ATM', credit: 'Credit', cvs: 'CVS'}
    end
    def calculate_total
      self.amount + Balance.calculate_list[self.billing.to_sym]
    end
  end
end