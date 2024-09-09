# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :author, Types::UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
