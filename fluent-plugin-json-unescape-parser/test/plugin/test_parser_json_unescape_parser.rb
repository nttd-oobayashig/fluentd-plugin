require "helper"
require "fluent/plugin/parser_json_unescape_parser.rb"

class JsonUnescapeParserParserTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
    @parser = Fluent::Test::Driver::Parser.new(Fluent::Plugin::JsonUnescapeParser)
  end

  data('oj' => 'oj', 'yajl' => 'yajl')
  def test_parse(data)
    @parser.configure('json_parser' => data)
    @parser.instance.parse('{"time":1362020400,"host":"192.168.0.1","size":777,"method":"PUT"}') { |time, record|
      assert_equal(event_time('2013-02-28 12:00:00 +0900').to_i, time)
      #assert_equal({
      #               'host'   => '192.168.0.1',
      #               'size'   => 777,
      #               'method' => 'PUT',
      #             }, record)
    }
  end

#  test "parse" do
#    d = create_driver.instance
    # assert_equal("{\"field1\": \"data1\", \"field2\": \"data2\"}", d.parser("{\\\"field1\\\": \\\"data1\\\" , \\\"field2\\\": \\\"data2\\\"}"))
    #d.parse("{\\\"field1\\\": \\\"data1\\\" , \\\"field2\\\": \\\"data2\\\"}")
#    d.parse("{\"field1\": \"data1\", \"field2\": \"data2\"}")
#  end
end
