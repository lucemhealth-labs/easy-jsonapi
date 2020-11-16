# frozen_string_literal: true

require 'rack/jsonapi/document/resource/attributes/attribute'
require 'shared_examples/name_value_pair_classes_tests'

describe JSONAPI::Document::Resource::Attributes::Attribute do
  it_behaves_like 'name value pair classes' do
    let(:pair) { JSONAPI::Document::Resource::Attributes::Attribute.new(:name, 'value') }
  end
end