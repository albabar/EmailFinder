# frozen_string_literal: true

RSpec.describe EmailGenerator do
  let(:instance) { EmailGenerator.new(first_name, last_name, domain) }

  describe '#generate' do
    subject { instance.generate }
    let(:first_name) { "Ben" }
    let(:last_name) { "Pratt" }
    let(:domain) { "8returns.com" }
    let(:expected_emails) do
      %w[ben.pratt@8returns.com ben@8returns.com benpratt@8returns.com
        pratt.ben@8returns.com b.pratt@8returns.com bp@8returns.com]
    end

    it "generates a list of possible email address" do
      is_expected.to match_array(expected_emails)
    end

    context "empty first name" do
      let(:first_name) { nil }

      let(:expected_emails) do
        %w[pratt@8returns.com p@8returns.com]
      end

      it "generates a list of possible email address without firstname" do
        is_expected.to match_array(expected_emails)
      end
    end

    context "empty last name" do
      let(:last_name) { nil }

      let(:expected_emails) do
        %w[ben@8returns.com b@8returns.com]
      end

      it "generates a list of possible email address without firstname" do
        is_expected.to match_array(expected_emails)
      end
    end

    context "empty domain" do
      let(:domain) { nil }

      it "generates a list of possible email address without firstname" do
        expect { subject }.to raise_error(ArgumentError, "Invalid/Empty domain")
      end
    end
  end
end
