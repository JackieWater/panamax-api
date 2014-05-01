class ServicesController < ApplicationController
  respond_to :json

  def index
    respond_with app.services
  end

  def show
    respond_with app.services.find(params[:id])
  end

  def update
    service = app.services.find(params[:id])
    if service.update_with_relationships(service_update_params)
      service.restart
    end
    respond_with service
  end

  def journal
    respond_with app.services.find(params[:id]).journal
  end

  private

  def app
    @app ||= App.find(params[:app_id])
  end

  def service_update_params
    params.permit(
      :name,
      :description,
      :ports => [[:host_interface, :host_port, :container_port, :proto]],
      :expose => [],
      :volumes => [[:host_path, :container_path]],
      :links => [[:service_id, :alias]]
    ).tap do |whitelisted|
      whitelisted[:environment] = params[:environment]
    end
  end

end
