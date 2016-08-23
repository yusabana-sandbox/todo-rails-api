class ApplicationController < ActionController::API
  include Knock::Authenticable

  # refs. https://github.com/r7kamura/weak_parameters/blob/master/lib/weak_parameters.rb#L59
  extend WeakParameters::Controller

  rescue_from WeakParameters::ValidationError do
    head 400
  end
end
