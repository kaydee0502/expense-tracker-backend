# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # In development, allow requests from common frontend development servers
    if Rails.env.development?
      origins 'localhost:3000', 'localhost:3001', 'localhost:4200', 'localhost:8000', '127.0.0.1:3000'
    elsif Rails.env.production?
      # Replace with your actual frontend domain(s)
      origins ENV.fetch('FRONTEND_URL', 'https://your-frontend-domain.com')
    else
      # Test environment
      origins '*'
    end

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      expose: ['Authorization', 'Content-Type', 'X-Requested-With']
  end
end
