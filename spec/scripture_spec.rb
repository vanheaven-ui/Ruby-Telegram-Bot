require_relative '../lib/scripture'

describe Scripture do
  let(:verse) { Scripture.new }
  json_obj =
    {
      'verse' =>
      {
        'details' =>
        {
          'text' => 'I remain confident of this: I will see the goodness of the lord in the land of the living.',
          'reference' => 'Psalm 27:13 ', 'version' => 'NIV', 'verseurl' => 'http://www.ourmanna.com/'
        },
        'notice' => 'Powered by OurManna.com'
      }
    }
  expected = 'I remain confident of this: I will see the goodness of the lord in the land of the living.- Psalm 27:13 '
  describe '#refactor' do
    it 'returns string version of a json object' do
      allow(verse).to receive(:return_json).and_return(json_obj)
      expect(verse.refactor).to eql(expected)
    end
  end
end
