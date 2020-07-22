require_relative '../lib/helper'
require_relative '../lib/bot'


describe BotHelper do
  let(:helper) { BotHelper.new }
  let(:bot) { TelegramBot.new } 
  describe '#when_start' do
    expected = 
      <<~HERE
        🤝Hello again, vanheaven

        You have officially started our chat.

        Send me any of the remaining commands below and I will reply accordingly.\n
        /stop - To stop this conversation,
        /verse - To get a special verse
        /news - To get the latest five US news headlines
      HERE
    context "no argument given" do
      it 'raise ArgumentError' do
        expect(subject.when_start).to raise_error(ArgumentError)
      end 
    end
    context 'argument given' do
      it 'returns expected' do
        bot.variable_instance_set(:@user_name, 'vanheaven')
        expect(helper.when_start(@user_name)).to eql(expected)
      end
    end
  end
end