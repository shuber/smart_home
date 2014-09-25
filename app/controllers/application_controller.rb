class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    authenticate_or_request_with_http_basic do |username, password|
      valid_username = 'admin'
      valid_password = '2ed92f0f5cfd4f5bc50cc2810f63be16ef5b9732e660d5db40deca887547344a'
      hashed_password = Digest::SHA2.hexdigest password

      valid_username == username && valid_password == hashed_password
    end
  end
end
