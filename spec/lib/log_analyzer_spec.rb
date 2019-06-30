require './lib/log_analyzer'

RSpec.describe LogAnalyzer do
  let(:file_path) { './spec/log_test.log' }
  subject { described_class.new(file_path) }

  describe '#parsing' do
    before { subject.parsing }
    let(:expected_results) do
      {
        '/contact' => ['184.123.665.067'],
        '/about' => ['126.318.035.038'],
        '/about/1' => ['126.318.035.033'],
        '/about/2' => ['836.973.694.403'],
        '/home' => ['897.280.786.156', '715.156.286.412'],
        '/help_page/1' => ['126.318.035.038', '444.701.448.104', '126.318.035.038']
      }
    end
    it 'the data is parsed successfully' do
      expect(subject.parsing).to eq(expected_results)
    end
  end

  describe '#most_views' do
    before { subject.parsing }
    let(:expected_results) do
      {
        '/help_page/1' => 3,
        '/home' => 2,
        '/about' => 1,
        '/about/1' => 1,
        '/about/2' => 1,
        '/contact' => 1
      }
    end

    it 'successfully ' do
      expect(subject.most_views).to eq(expected_results)
    end
  end

  describe '#unique_views' do
    before { subject.parsing }

    let(:expected_results) do
      {
        '/home' => 2,
        '/help_page/1' => 2,
        '/about' => 1,
        '/about/1' => 1,
        '/about/2' => 1,
        '/contact' => 1
      }
    end

    it 'returns the correct values' do
      expect(subject.unique_views).to eq(expected_results)
    end
  end
end
