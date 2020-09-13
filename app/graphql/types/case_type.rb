module Types
  class CaseType < Types::BaseObject
    field :id, ID, null: false
    field :value, Int, null: false
    field :status, Types::CaseStatus, null: false
    field :case_date, GraphQL::Types::ISO8601Date, null: false
    field :lawyer, Types::LawyerType, null: false
    field :client, Types::ClientType, null: false
    field :court, Types::CourtType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
