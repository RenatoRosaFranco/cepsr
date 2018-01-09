# sanitizer:string
module Filterable
  extend ActiveSupport::Concern
  # sanitizer:string
  module ClassMethods
    def filter(params)
      results = unscoped
      params.each do |key, value|
        results = results.public_send(key, value) if value
      end
      results
    end
  end
end
