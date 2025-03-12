module Resolvers
    class CreatePostResolver < Resolvers::BaseResolver

        def self.call(id:)
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