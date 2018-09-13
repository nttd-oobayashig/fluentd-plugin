require "helper"
require "fluent/plugin/filter_json_unescape_parser.rb"

class JsonUnescapeParserFilterTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Filter.new(Fluent::Plugin::JsonUnescapeParserFilter).configure(conf)
  end
end
