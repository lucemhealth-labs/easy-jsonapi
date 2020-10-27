# frozen_string_literal: true

require 'rack/jsonapi/collection'
require 'rack/jsonapi/item'
require_relative '../spec/collection_subclasses_shared_tests'

describe JSONAPI::Collection do
  it_behaves_like 'collection like classes' do
    let(:item_class) { JSONAPI::Item }
    let(:c_size) { 5 }
    let(:keys) { %i[include lebron charles michael kobe] }
    let(:ex_item_key) { :include }
    let(:ex_item_value) { 'author,comments,likes' }

    let(:to_string) do
      '{ ' \
        "include => { name => 'include', value => 'author,comments,likes' }, " \
        "lebron => { name => 'lebron', value => 'james' }, " \
        "charles => { name => 'charles', value => 'barkley' }, " \
        "michael => { name => 'michael', value => 'jordan,jackson' }, " \
        "kobe => { name => 'kobe', value => 'bryant' }" \
      ' }'
    end

    obj_arr = [
      { name: 'include', value: 'author,comments,likes' },
      { name: 'lebron', value: 'james' },
      { name: 'charles', value: 'barkley' },
      { name: 'michael', value: 'jordan,jackson' },
      { name: 'kobe', value: 'bryant' }
    ]
  
    item_arr = obj_arr.map { |i| JSONAPI::Item.new(i) }
    let(:c) { JSONAPI::Collection.new(item_arr, &:name) }
    let(:ec) { JSONAPI::Collection.new }
  
  end
end
