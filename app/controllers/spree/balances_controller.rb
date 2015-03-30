class Spree::BalancesController < Spree::StoreController
  skip_before_action :verify_authenticity_token, only: [:pay]
  skip_before_filter :verify_authenticity_token, only: [:notify]
  respond_to :html

  include AllpayHelper

  def index
    @balances = spree_current_user.balances
  end

  def create
    @balance = spree_current_user.balances.create
    @balance.update_attributes(permitted_params)
    @balance.total = @balance.calculate_total
    @balance.state = 1
    @balance.save
    redirect_to action: :pay, id: @balance.id
  end

  def new
    @balance = Spree::Balance.new
    @amount_list = Spree::Balance.amount_list
    @billing_list = Spree::Balance.billing_list
    @calculate_list = Spree::Balance.calculate_list
  end

  def pay
    @balance = spree_current_user.balances.find(params[:id])
    if @balance.state != 1
      redirect_to action: :index
    end

    @data = {
      'ChoosePayment' => Spree::Balance.allpay_list[@balance.billing.to_sym],
      'ItemName' => "儲值#{@balance.amount}",
      'MerchantID' => '1033611',
      'MerchantTradeDate' => @balance.created_at.strftime("%Y/%m/%d %H:%M:%S"),
      'MerchantTradeNo' => "bb#{@balance.id}",
      'PaymentType' => 'aio',
      'ReturnURL' => 'http://111.250.187.189/balances/notify',
      'TotalAmount' => @balance.total,
      'TradeDesc' => "儲值#{@balance.amount}"
    }

    string = create_calculate_check_mac_key(@data, '3w9WxBP4wECTbFQn', 'eW1YA5YtX1NfCPm2')
    @data['CheckMacValue'] = string

  end
  def notify
    notification = Spree::AllpayNotification.new(request.raw_post)

    # order = Order.find_by_number(notification.merchant_trade_no)

    binding.pry
    if notification.status && notification.checksum_ok?
      puts 'weqrwqrqwrqw'
    else
      puts 'qwjrilqjrli'
    end

    render text: '1|OK', status: 200
  end

private
  def permitted_params
    params.require(:balance).permit(:amount, :billing)
  end

end
