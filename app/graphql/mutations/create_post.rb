# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
    argument :user_id, ID, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(title:, body:, user_id:)
      user = User.find(user_id)
      post = user.posts.new(title:, body:)
      if post.save
        {
          post:,
          errors: []
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
