class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def sanitize(input_field)
    Sanitize.fragment(input_field, Sanitize::Config::RELAXED)
  end

  def sanitize_input(input_params, fields)
    fields.each do |field|
      input_params[field] = sanitize(input_params[field]) if input_params.key? field
    end
  end

  def sanitize_attributes(attributes, fields)
    return if attributes.nil?
    attributes.each do |content_block_attributes|
      sanitize_input(content_block_attributes[1], fields)
    end
  end
end
