RSpec.describe Gig::Gig do
  let(:mocked_repositories) { instance_double(Gig::Repositories) }
  before do
    allow(Gig::Repositories).to receive(:new).and_return(mocked_repositories)
    allow(mocked_repositories).to receive(:search).and_return(true)
    allow(mocked_repositories).to receive(:owners).and_return([])
    allow(Gig::Downloader).to receive(:run).and_return(true)
  end

  it 'has a version number' do
    expect(Gig::VERSION).not_to be nil
  end

  it 'can run when given search terms' do
    gig = Gig::Gig.new(['language:ruby'])
    expect(gig.run).to eq(true)
  end

  it 'raises an error when given no search terms' do
    expect { Gig::Gig.new([]) }.to raise_error(ArgumentError)
  end
end
