module Types
    class PostType < Types::BaseObject
        field :id, String, null: false
        field :userName, String, null: false
        field :type, String, null: false
        field :content, String, null: false
    end
end
