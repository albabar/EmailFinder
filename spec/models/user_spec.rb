# frozen_string_literal: true

RSpec.describe User, type: :model do
  let(:first_name) { "Agdum" }
  let(:last_name) { "Bagdum" }
  let(:domain) { "bagdum.com" }
  let(:email) { "agdum@bagdum.com" }
  let!(:user) { User.create!(first_name: first_name, last_name: last_name, domain: domain, email: email) }

  describe "#first_name" do
    it "is case insensitive" do
      expect(User.find_by!(first_name: "aGdum").id).to eq(user.id)
    end
  end

  describe "#last_name" do
    it "is case insensitive" do
      expect(User.find_by!(last_name: "BagDUM").id).to eq(user.id)
    end
  end

  describe "#domain" do
    it "is case insensitive" do
      expect(User.find_by!(domain: "BagDum.Com").id).to eq(user.id)
    end
  end
end
