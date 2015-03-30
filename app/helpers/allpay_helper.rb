module AllpayHelper
  def create_calculate_check_mac_key(item_options, hash_key, hash_iv)
    add_check_key("HashKey=" + hash_key + "&" + render_hash_params_to_request(item_options) + "&HashIV=" + hash_iv).upcase
  end

  def render_hash_params_to_request(key)
    result = key.to_a.sort.map do |key, value|
      "#{key}=#{value}"
    end

    result.join("&")
  end

  def add_check_key(key)
    render_key_to_md5(CGI::escape(key).downcase)
  end

  def render_key_to_md5(key)
    Digest::MD5.hexdigest(key)
  end
end
