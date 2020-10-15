# frozen_string_literal: true

RSpec.describe MailboxlayerApi do
  let(:instance) { MailboxlayerApi.new(email) }

  describe '#valid?' do
    subject { instance.valid? }
    before { allow_any_instance_of(MailboxlayerApi).to receive(:result).and_return(mock_result) }
    let(:mock_result) do
      {
        email: email,
        format_valid: true,
        mx_found: true,
        smtp_check: true,
      }
    end
    let(:email) { "agdum@bagdum.com" }

    it { is_expected.to be_truthy }

    context "invalid format" do
      let(:mock_result) do
        {
          email: email,
          format_valid: false,
          mx_found: true,
          smtp_check: true,
        }
      end

      it { is_expected.to be false }
    end

    context "mx not found" do
      let(:mock_result) do
        {
          email: email,
          format_valid: true,
          mx_found: false,
          smtp_check: true,
        }
      end

      it { is_expected.to be false }
    end

    context "smtp check failed" do
      let(:mock_result) do
        {
          email: email,
          format_valid: true,
          mx_found: true,
          smtp_check: false,
        }
      end

      it { is_expected.to be false }
    end
  end
end
