# frozen_string_literal: true

class EmailGenerator
  def initialize(first_name, last_name, domain)
    @first_name = first_name.to_s.delete(' ')
    @last_name = last_name.to_s.delete(' ')
    @domain = domain.to_s
    raise ArgumentError, "Invalid/Empty domain" if domain.blank? || !domain.include?('.')
  end

  def generate
    generate_users.map { |name| "#{name.downcase}@#{domain}" }
  end

  private

  attr_reader :first_name, :last_name, :domain

  def generate_users
    [
      "#{first_name}.#{last_name}",
      first_name,
      "#{first_name}#{last_name}",
      "#{last_name}.#{first_name}",
      "#{first_name[0]}.#{last_name}",
      "#{first_name[0]}#{last_name[0]}",
    ].reject { |name| name.blank? || name.starts_with?('.') || name.ends_with?('.') }.uniq
  end
end
