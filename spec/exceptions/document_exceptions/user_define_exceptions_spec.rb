# frozen_string_literal: true

require 'rack/jsonapi/exceptions/document_exceptions/user_defined_exceptions'

describe JSONAPI::Exceptions::DocumentExceptions::UserDefinedExceptions do

  let(:err) { JSONAPI::Exceptions::DocumentExceptions::InvalidDocument }

  let(:doc1) do
    {
      data: {
        type: 'testing',
        attributes: {
          a1: 'a1',
          a2: 'a2'
        }
      }
    }
  end

  let(:doc_bad_arr) do
    {
      data: [
        {
          type: 'testing',
          attributes: {
            a1: 'a1',
            a2: 'a2'
          }
        },
        {
          type: 'testing2'

        },
        {
          type: 'testing3'
        }
      ]
    }
  end

  let(:doc_good_arr) do
    {
      data: [
        {
          type: 'testing',
          attributes: {
            a1: 'a1',
            a2: 'a2'
          }
        },
        {
          type: 'testing2',
          attributes: {
            a1: 'a1',
            a2: 'a2'
          }
        },
        {
          type: 'testing3',
          attributes: {
            a1: 'a1',
            a2: 'a2'
          }
        }
      ]
    }
  end

  let(:req_check_top_level) do
    {
      data: {
        type: nil,
        attributes: nil
      },
      meta: nil
    }
  end

  let(:req_check_lower_level) do
    {
      data: {
        type: nil,
        attributes: { a3: nil }
      }
    }
  end

  let(:req_mic_doc1) do
    {
      data: {
        type: nil,
        attributes: nil
      }
    }
  end

  let(:req_arr) do
    {
      data: [
        {
          type: nil,
          attributes: {
            a1: nil, a2: nil
          }
        }
      ]
    }
  end
  
  def check(document, req)
    JSONAPI::Exceptions::DocumentExceptions::UserDefinedExceptions.check_additional_required_members(document, req)
  end

  describe 'check_additional_required_members' do
    it 'should raise when a top-level, user-defined, required member is not included' do
      expect { check(doc1, req_check_top_level) }.to raise_error err, 'Document is missing one of the user-defined required keys: meta'
    end

    it 'should raise when a lower-level, user-defined, required member is not included' do
      expect { check(doc1, req_check_lower_level) }.to raise_error err, 'Document is missing one of the user-defined required keys: a3'
    end

    it 'should pass if all the required keys are included' do
      expect(check(doc1, req_mic_doc1)).to be nil
    end

    it 'should check each obj in a array to make sure it includes the required memebers' do
      expect { check(doc_bad_arr, req_arr) }.to raise_error err, 'Document is missing one of the user-defined required keys: attributes'
      expect(check(doc_good_arr, req_arr)).to be nil
    end
  end
end
