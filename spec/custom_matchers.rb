require 'rspec/expectations'
require 'json'

JSON_CONTENT_TYPE_STRING = 'application/json; charset=utf-8'.freeze

RSpec::Matchers.define :have_content_type_json do
  match do |actual|
    actual.content_type == JSON_CONTENT_TYPE_STRING
  end
  description do
    "has Content-Type header of #{JSON_CONTENT_TYPE_STRING}"
  end
  failure_message do |actual|
    "expected Content-Type header of #{actual.content_type} to be #{JSON_CONTENT_TYPE_STRING}."
  end
  failure_message_when_negated do
    "expected Content-Type header not to be #{JSON_CONTENT_TYPE_STRING}."
  end
end

RSpec::Matchers.define :contain_json_array_with_length do |expected_length|
  def parsed_body(response)
    JSON.parse(response.body)
  rescue StandardError
    response.body
  end

  match do |actual|
    body = parsed_body(actual)
    body.is_a?(Array) && (body.length == expected_length)
  end
  description do
    "returns a JSON array with #{expected_length} elements."
  end
  failure_message do |actual|
    body = parsed_body(actual)
    if body.is_a?(Array)
      "expected a JSON array with #{expected_length} elements, but only found #{body.size}."
    else
      "expected #{body.inspect} to be a JSON array, but it was not."
    end
  end
end
