# frozen_string_literal: true

RSpec.describe Services::Users::Create do
  subject(:subj) do
    described_class.new(osparams)
  end

  let(:osparams) do
    OpenStruct.new(params)
  end

  describe '#call' do
    context 'with correct params' do
      let(:params) do
        {
          type: 'users',
          data: {
            username: FFaker::Name.name,
            password: SecureRandom.hex(4)
          }
        }
      end

      it 'creates new correct user' do
        expect { subj.call }.to change{ User.count }.by(1)
      end

      # it 'returns created' do
      #
      # end
    end

    # context 'with bad params (w/o password)' do
    #   let(:params) do
    #     {
    #       type: 'users',
    #       data: {
    #         username: FFaker::Name.name
    #       }
    #     }
    #   end
    #
    #   it "doesn't creates user" do
    #
    #   end
    #
    #   it 'returns bad request' do
    #
    #   end
    # end
  end
end