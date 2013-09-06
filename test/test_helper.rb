require 'rubygems'
require 'test/unit'
require 'pp'
# require 'debugger'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))


SETTLER_ORM = (ENV["SETTLER_ORM"] || :active_record).to_sym

gem "activerecord"
require 'fileutils'

if SETTLER_ORM == :active_record
  require 'active_record'
  require 'settler/orm/active_record'
  require 'settler/setting'
elsif SETTLER_ORM == :mongoid
  require 'mongoid'
  require 'settler/orm/mongoid'
  require 'orm_helper_mongoid'
  require 'settler/setting'
else
  raise "ORM not supported"
end

  require 'active_support/core_ext/class/attribute_accessors'
  require 'active_support/buffered_logger'

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.logger = ActiveSupport::BufferedLogger.new(File.dirname(__FILE__) + "/debug.log") if SETTLER_ORM == :active_record
  db_adapter = ENV['DB']
  # no db passed, try one of these fine config-free DBs before bombing.
  db_adapter ||= begin
    require 'rubygems'
    require 'sqlite'
    'sqlite'
  rescue MissingSourceFile
    begin
      require 'sqlite3'
      'sqlite3'
    rescue MissingSourceFile
    end
  end

  if db_adapter.nil?
    raise "No DB Adapter selected. Pass the DB= option to pick one, or install Sqlite or Sqlite3."
  end
  ActiveRecord::Base.establish_connection(config[db_adapter]) if SETTLER_ORM == :active_record
  load(File.dirname(__FILE__) + "/schema.rb") if SETTLER_ORM == :active_record
end  

load_schema
require File.dirname(__FILE__) + '/../init.rb'

