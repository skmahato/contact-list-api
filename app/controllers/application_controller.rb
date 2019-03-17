class ApplicationController < ActionController::API
  def render_success(status, resource)
    render json: resource.as_json, status: status
  end

  def render_error(status, errors = [])
    if errors.is_a?(ActiveModel::Errors)
      render json: { errors: Hash[errors.keys.collect {|f| [f, errors.full_messages_for(f)] }] }, status: status
    else
      render json: { errors: errors }, status: status
    end
  end
end
