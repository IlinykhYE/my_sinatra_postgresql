require 'sequel'
require 'sequel/extensions/seed'
require  'pg'
require 'json'
require 'multi_json'
require 'sinatra'

Sequel::Model.plugin :json_serializer

DB = Sequel.connect(
  adapter: :postgres,
  database: 'sinatra_seq_dev',
  host: 'localhost',
  password: 'Rhfcjnf1998',
  user: 'postgres',
  max_connections: 10,
)

%w[controllers models routes].each { |dir| Dir.glob("./#{ dir }/*.rb").sort.each(&method(:require)) }

# Endpoints format setup
before do
  content_type 'application/json' # To see perfectly in POSTMAN - in tab Pretty
end

def collection_to_api(collection)
  # For Array
  MultiJson.dump(collection.map { |s| s.to_api })
end


# %w[controllers models routes].each do | dir |
#   $LOAD_PATH << File.expand_path('.', File.join(File.dirname(__FILE__), dir))
#   require File.join(dir, 'init')
# end
#
