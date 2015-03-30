module Spree
  class PaymentMethod::Balance < PaymentMethod
    def actions
      %w{capture void}
    end

    def payment_source_class
      UsedBalance
    end

    def capture(*args)
      binding.pry
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def source_required?
      true
    end

    def auto_capture
      false
    end

    def cancel(response); end

    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def process(money)
      binding.pry
      d = 1
    end

    def authorize(money, used_balance, params)
      money = money / 100
      used_balance.amount = money
      used_balance.save

      user = used_balance.user
      if user.balance < money
        ActiveMerchant::Billing::Response.new(false, 'Balance is not enough', { :message => 'Balance is not enough' }, :test => true)
      else
        user.decrement!(:balance, money)
        used_balance.success = true
        used_balance.save
        ActiveMerchant::Billing::Response.new(true, 'Bogus Gateway: Forced success', {}, :test => true, :authorization => '12345', :avs_result => { :code => 'D' })
      end
    end
  end
end
