require "spec_helper"

RSpec.describe We::Interstellar::Client do

  let(:conn_double) { double }
  subject { described_class.new(conn_double) }

  describe '#get_memberships' do
    before { allow(conn_double).to receive(:get) }

    context 'when called with a uuid' do
      it 'calls memberhsip endpoint with uuid' do
        expect(conn_double).to receive(:get).with("/memberships/#{user.uuid}")
        subject.get_memberships(uuid)
      end
    end
  end
end
