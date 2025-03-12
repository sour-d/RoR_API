require 'rails_helper'

RSpec.describe "CreatePost Mutation", type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        createPost(input: { id: "100" }) {
            posts {
                id
            }
            error
        }
      }
    GQL
  end

   let(:duplicate_mutation) do
    <<~GQL
      mutation {
        createPost(input: { id: "1" }) {
            posts {
                id
            }
            error
        }
      }
    GQL
  end

  it "creates a post successfully" do
    post "/graphql", params: { query: mutation }
    
    json = JSON.parse(response.body)
    data = json["data"]["createPost"]["posts"]
    error = json["data"]["createPost"]["error"]

    expect(response).to have_http_status(:success)
    expect(data).to eq([
        {"id" => "1"},
        {"id" => "2"},
        {"id" => "100"}
    ])
    expect(error).to eq("no error found")
  end

  it "throw error" do
    post "/graphql", params: {query: duplicate_mutation }

    json = JSON.parse(response.body)
    error = json["errors"][0]["message"]
    
    expect(error).to eq("ID cannot be 1")
  end
end
