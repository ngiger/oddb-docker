require 'dbi'                                                                     
require 'odba/connection_pool'                                                    
require 'pg'
while true
  begin
    ODBA.storage.dbi = ODBA::ConnectionPool.new('DBI:Pg:oddb:pgoddborg', 'postgres', 'example')
    puts "Startup successfull"
    break
  rescue => error
    puts "Startup error is #{error}. Will sleep 5 seconds"
    sleep 5
  end
end

def dump_first_odba_entries(max_id = 20)
1.upto(max_id).each do |idx|
  begin
      group = ODBA.cache.fetch(idx)
      puts "For #{idx} we have a #{group.class}"
      if group.is_a?(Hash)
        puts "idx #{idx}: #{group.keys}"
      elsif group.is_a?(ODDB::GalenicGroup)
        puts group.inspect
        puts group.route_of_administration
        puts group.galenic_forms
        puts "de is #{group.de.inspect}"
      end
  rescue ODBA::OdbaError
    break
  end
end

require 'util/oddbapp'

