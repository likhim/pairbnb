Resque.redis = 'http://localhost:3000'
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }