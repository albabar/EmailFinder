# frozen_string_literal: true

require 'net/http'
require 'json'

class MailboxlayerApi
  BASE_URL = "https://apilayer.net/api/check"

  def initialize(email)
    @email = email
  end

  def valid?
    # FIXME: Could not use the CatchAll feature with free account.
    result[:format_valid] && result[:mx_found] && result[:smtp_check] # && result[:score] >= 0.65
  end

  def result
    return @result if @result.present?

    response = Net::HTTP.get(request_uri)
    @result ||= JSON.parse(response, symbolize_names: true)
  end

  # private

  def request_uri
    URI("#{BASE_URL}?#{URI.encode_www_form(params)}")
  end

  def params
    {
      access_key: Rails.application.credentials.mailboxlayer_key,
      email: @email
    }
  end
end
