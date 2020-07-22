require_relative '../lib/helper'

describe BotHelper do
  let(:helper) { BotHelper.new }
  describe '#when_start' do
    expected =
      <<~HERE
        🤝Hello again, Vanheaven

        You have officially started our chat.

        Send me any of the remaining commands below and I will reply accordingly.\n
        /stop - To stop this conversation,
        /verse - To get a special verse
        /news - To get the latest five US news headlines
      HERE
    context 'no argument given' do
      it 'raises ArgumentError' do
        expect { helper.when_start }.to raise_error(ArgumentError)
      end
    end
    context 'argument given' do
      it 'returns expected string layout' do
        expect(helper.when_start('Vanheaven')).to eql(expected)
      end
    end
  end

  describe '#when_verse' do
    expected = "Here is a special verse for you:\n"
    it 'returns expected string' do
      expect(helper.when_verse).to eql(expected)
    end
  end

  describe '#when_news' do
    expected = "Here are the latest five news headlines in the US:\n"
    it 'return expected string' do
      expect(helper.when_news).to eql(expected)
    end
  end

  describe '#when_help' do
    expected =
      <<~HERE
        I am a bot that is here to take your commands and give you bible verses and the latest US news headlines alike.
        Please choose any of these commands from the buttons at the bottom or type them to control me
        **Better to start with /start**\n
        /start - start conversation with me
        /stop - stop conversation with me
        /verse - choose this and I will reply with a bible verse
        /news - choose this and I will reply with the latest 5 US news headlines
        
      HERE
    it 'return expected string' do
      expect(helper.when_help).to eq(expected)
    end
  end

  describe '#commands' do
    expected =
      <<~HERE
        Please choose any of these commands from the buttons at the bottom or type them to control me
        **Better to start with /start**\n
        /start - start conversation with me
        /stop - stop conversation with me
        /verse - choose this and I will reply with a bible verse
        /news - choose this and I will reply with the latest 5 US news headlines
      HERE
    it 'returns a list of commands' do
      expect(helper.commands).to eql(expected)
    end
  end

  describe '#when_stop' do
    expected =
      <<~HERE
        👋Bye! Vanheaven,
          You have ended our chat
      HERE
    it 'returns expected string' do
      expect(helper.when_stop('Vanheaven')).to eql(expected)
    end
  end

  describe '#same_command' do
    expected =
      <<~HERE
        Enjoy the verse?
        Choose /verse again for another verse or
        Choose from the rest of the commands below
      HERE
    context 'No arguments passed' do
      it 'raises ArgumentError' do
        expect { helper.same_command }.to raise_error(ArgumentError)
      end
    end

    context 'Arguments passed' do
      it 'returns expected string' do
        expect(helper.same_command('/verse')).to eql(expected)
      end
    end
  end

  describe '#choose_other' do
    expected_v =
      <<~HERE
        /news - to get news updates in the US
        /stop - to end our chat
      HERE
    expected_n =
      <<~HERE
        /verse - to get a bible verse
        /stop - to end our chat
      HERE
    context 'No arguments passed' do
      it 'raises ArgumentError' do
        expect { helper.choose_other }.to raise_error(ArgumentError)
      end
    end
    context '/verse passed as arguments' do
      it 'returns expected string' do
        expect(helper.choose_other('/verse')).to eql(expected_v)
      end
    end

    context '/news passed as arguments' do
      it 'returns expected string' do
        expect(helper.choose_other('/news')).to eql(expected_n)
      end
    end
  end
end
