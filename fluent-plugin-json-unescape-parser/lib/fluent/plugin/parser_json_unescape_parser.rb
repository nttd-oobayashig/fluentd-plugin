#
# Copyright 2018- nttd-oobayashig
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "fluent/plugin/parser"
require "json"
require "yaml"

module Fluent
  module Plugin
    class JsonUnescapeParserParser < Fluent::Plugin::JSONParser
      Fluent::Plugin.register_parser("json_unescape_parser", self)

      config_param :json_unescape_parser, :enum, list: [:oj, :yajl, :json], default: :oj


      def configuration(conf)
        super
      end

      def parse(text)
        r = @load_proc.call(YAML.load text)
        yield r
      end
    end
  end
end
