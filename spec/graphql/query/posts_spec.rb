require 'rails_helper'

RSpec.describe "post Query", type: :request do
#   let!(:post) { Post.create(id: 1, title: "GraphQL Testing") }

  let(:query) do
    <<~GQL
      query {
        posts {
          id
        }
      }
    GQL
  end

  it "returns the correct post" do
    post "/graphql", params: { query: query }
    
    json = JSON.parse(response.body)
    data = json["data"]["posts"]

    expect(response).to have_http_status(:success)
    expect(data).to eq([{"id"=> "1"}, {"id"=> "2"}])
  end
end
