module Resolvers
    class PostsResolver < Resolvers::BaseResolver
        type [Types::PostType], null: false

        def resolve
            [
                { id: '1' },
                { id: '2' },
            ]
        end
    end
end