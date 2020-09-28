module RedmineBots::Telegram
  module Utils
    def self.auth_hash(data)
      check_string = data.except('hash').map { |k, v| "#{k}=#{v}" }.join("\n")
      secret_key = Digest::SHA256.digest(Bot::Token.instance.to_s)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret_key, check_string)
    end
  end
end
