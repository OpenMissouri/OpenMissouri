class SunshineRequestsController < ApplicationController
  inherit_resources

  protected

  def collection
    @sunshine_requests ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
