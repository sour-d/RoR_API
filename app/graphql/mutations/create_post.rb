module Mutations
  class CreatePost < Mutations::BaseMutation
    # Change input type from an object to a simple String
    argument :id, String, required: true

    # Define return type
    field :posts, [Types::PostType], null: false
    field :error, String, null: false

    def resolve(id:)
      Resolvers::CreatePostResolver.call(id: id)
    end
  end
end
