OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "144833462544464", "53d6c0e692568ed565f8037df3201d72", 
        { :scope => 'email', :info_fields => 'email, name, first_name, last_name, gender' }
end