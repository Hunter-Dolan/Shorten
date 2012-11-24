
#	def self.do arguments
#		connection = Hiredis::Connection.new
#		if ENV["REDISCLOUD_URL"].nil?
#			connection.connect("127.0.0.1", 6379)
#		else
#			uri = URI.parse(ENV["REDISCLOUD_URL"])
#			connection.connect(uri.host, uri.port)
#			connection.auth(uri.user, uri.password)
#		end
#		connection.write arguments
#		connection.read
#	end
	if ENV["VCAP_SERVICES"].nil?
		$redis = Redis.new(:host => 'localhost', :port => 6379)
	else
		services = JSON.parse(ENV['VCAP_SERVICES'])
		redis_key = services.keys.select { |svc| svc =~ /redis/i }.first
		redis = services[redis_key].first['credentials']
		redis_conf = {:host => redis['hostname'], :port => redis['port'], :password => redis['password']}
		$redis = Redis.new redis_conf
	end
