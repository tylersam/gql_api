module Types
  class QueryType < Types::BaseObject
    field :lawyer, LawyerType, null: true do
      description "Find a lawyer by ID"
      argument :id, ID, required: true
    end

    field :lawyers, [LawyerType], null: true

    def lawyer(id:)
      Lawyer.find(id)
    end

    def lawyers
      Lawyer.all.order(:id)
    end
  end
end
