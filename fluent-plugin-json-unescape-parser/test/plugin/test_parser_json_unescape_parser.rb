require "helper"
require "fluent/plugin/parser_json_unescape_parser.rb"

class JsonUnescapeParserParserTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Parser.new(Fluent::Plugin::JsonUnescapeParserParser).configure(conf)
  end
end
