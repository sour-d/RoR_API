module Resolvers
    class PostsResolver < Resolvers::BaseResolver
        type [Types::PostType], null: false

        def resolve
            [
                { id: '1', userName: "user 1", type: "Sports", content: "user 1 post content ..." },
                { id: '2', userName: "user 2", type: "Movie", content: "user 2 post content on movie ..." },
            ]
        end
    end
end