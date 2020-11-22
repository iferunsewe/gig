RSpec.describe Gig::Repositories do
  let(:repositories) { Gig::Repositories.new('language:ruby language:rails') }
  let(:response) { instance_double(HTTParty::Response, parsed_response: parsed_response, code: code) }

  it 'has the correct api path' do
    expect(Gig::Repositories::API_PATH).to eq('/search/repositories')
  end
  
  context 'when response gives a 200 error code' do
    let(:code) { 200 }
    let(:parsed_response) do
      {
        'total_count' => 2,
        'items' => [
          {
            'full_name' => 'dtrupenn/Tetris',
            'owner' => {
              'login' => 'dtrupenn',
              'id' => 872147,
              'avatar_url' => 'https =>//secure.gravatar.com/avatar'
            }
          },
          {
            'full_name' => 'dtrupennthesecond/Tetris',
            'owner' => {
              'login' => 'dtrupennthesecond',
              'id' => 872148,
              'avatar_url' => 'https://secure.gravatar.com/avatar'
            }
          }
        ]
      }
    end
    let(:owners_from_response) { parsed_response['items'].map { |item| item['owner'] } }

    it 'returns true and sets owners on the respositories instance' do
      allow(HTTParty).to receive(:get).and_return(response)
      expect(repositories.search).to eq(true)
      expect(repositories.owners).to eq(owners_from_response)
    end
  end

  context 'when response gives a 304 status code' do
    let(:code) { 304 }
    let(:parsed_response) do
      {
        'message' => 'Not modified'
      }
    end

    it 'returns false' do
      allow(HTTParty).to receive(:get).and_return(response)
      expect(repositories.search).to eq(false)
    end
  end

  context 'when response gives a 422 status code' do
    let(:code) { 422 }
    let(:parsed_response) do
      {
        'message' => 'Unprocessable Entity'
      }
    end

    it 'returns false' do
      allow(HTTParty).to receive(:get).and_return(response)
      expect(repositories.search).to eq(false)
    end
  end

  context 'when response gives a 503 status code' do
    let(:code) { 503 }
    let(:parsed_response) do
      {
        'message' => 'Service Unavailable'
      }
    end

    it 'returns false' do
      allow(HTTParty).to receive(:get).and_return(response)
      expect(repositories.search).to eq(false)
    end
  end
end
