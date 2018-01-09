module Filterable
  extend ActiveSupport::Concern
  module ClassMethods
    def filter(params)
      results = unscoped
      params.each do |key, value| do
        results = results.public_send(key, value) if value
      end
      results
    end
  end
end
