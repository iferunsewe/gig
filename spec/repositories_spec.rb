RSpec.describe Gig::Repositories do
  let(:ok_github_response) { instance_double(HTTParty::Response, parsed_response: parsed_response, code: 200) }
  let(:parsed_response) {
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
  }
  let(:owners_from_response) { parsed_response['items'].map { |item| item['owner'] } }

  it 'has the correct api path' do
    expect(Gig::Repositories::API_PATH).to eq('/search/repositories')
  end

  it 'returns owners when the query is valid' do
    allow(HTTParty).to receive(:get).and_return(ok_github_response)
    repos = Gig::Repositories.new('language:ruby language:rails')
    repos.search
    expect(repos.owners).to eq(owners_from_response)
  end
end
