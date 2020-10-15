# frozen_string_literal: true

RSpec.describe ValidEmailFinder do
  let(:instance) { ValidEmailFinder.new(first_name, last_name, domain) }

  describe '#find' do
    subject { instance.find! }
    let(:first_name) { "Ben" }
    let(:last_name) { "Pratt" }
    let(:domain) { "8returns.com" }

    it "it calls 3rd party API for each emails" do
      allow_any_instance_of(MailboxlayerApi).to receive(:result).and_return({})
      is_expected.to be_nil
    end
  end
end
