# frozen_string_literal: true

class ValidEmailFinder
  def initialize(first_name, last_name, domain)
    @emails = EmailGenerator.new(first_name, last_name, domain).generate
  end

  def find!
    @emails.find do |email|
      MailboxlayerApi.new(email).valid?
    end
  rescue => _e
    nil
  end
end
