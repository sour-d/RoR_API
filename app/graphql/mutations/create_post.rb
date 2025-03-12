module Mutations
  class CreatePost < Mutations::BaseMutation
    # Change input type from an object to a simple String
    argument :id, String, required: true

    # Define return type
    field :posts, [Types::PostType], null: false
    field :error, String, null: false

    def resolve(id:)

      # Error handling
      if ["1", "2"].include?(id)
        raise GraphQL::ExecutionError, "ID cannot be #{id}"
      end

      posts = [
        {id: '1'},
        {id: '2'},
        {id: id}
      ]

      { posts: posts, error: "no error found" }
    end
  end
end
