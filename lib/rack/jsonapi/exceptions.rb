# frozen_string_literal: true

module JSONAPI
  
  # Namespace for the gem's Exceptions
  module Exceptions

    # Validates that the Query Parameters comply with the JSONAPI specification
    module QueryParamsExceptions
    end
    
    # Validates that Headers comply with the JSONAPI specification
    module HeadersExceptions
    end

    # Validates that the request or response document complies with the JSONAPI specification  
    module DocumentExceptions
    end

    # Checking for JSONAPI naming rules compliance
    module NamingExceptions
    end

  end
end
