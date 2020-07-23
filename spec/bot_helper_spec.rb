require_relative '../lib/helper'

describe BotHelper do
  let(:helper) { BotHelper.new }
  describe '#when_start' do
    expected =
      <<~HERE
        🤝Hello, Vanheaven\n
        You have officially started our chat.\n
        Type /commands so that I can load a keyboard of the commands for you to choose from.
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
        I am a bot that is here to give you bible verses and the latest US news headlines alike.
        To control me, please choose any of these commands from the buttons at the bottom or type the commands.\n
        /verse - choose this and I will reply with a bible verse
        /news - choose this and I will reply with the latest 5 US news headlines
        /help - Get guidance
        /stop - stop conversation with me\n
      HERE
    it 'return expected string' do
      expect(helper.when_help).to eq(expected)
    end
  end

  describe '#commands' do
    expected =
      <<~HERE
        To control me, please choose any of these commands from the buttons at the bottom or type the commands.\n
        /verse - choose this and I will reply with a bible verse
        /news - choose this and I will reply with the latest 5 US news headlines
        /help - Get guidance
        /stop - stop conversation with me
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
