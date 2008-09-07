Merb.logger.info("Loaded DEVELOPMENT Environment...")
Merb::Config.use { |c|
  c[:exception_details] = true
  c[:reload_classes] = true
  c[:reload_time] = 0.5
  c[:log_auto_flush ] = true
  c[:log_level] = :debug
}

RAILS_PATH = File.join '..', '..', 'rails', 'lwdg_rails'
RAILS_URL = "http://localhost:3000"

