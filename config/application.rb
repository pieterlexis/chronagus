require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chronagus
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_view.sanitized_allowed_tags = [
      'p', 'h2', 'h3', 'h4', 'span', 'br', 'div',
      'i', 'em', 'strong', 'b', 'strike', 'del', 's', 'u', 'a',
      'ul', 'ol', 'li',
      'img',
    ]
    config.action_view.sanitized_allowed_attributes = [
      'style',
      'src', 'alt', 'title',
      'href', 'target',
    ]
  end
end
