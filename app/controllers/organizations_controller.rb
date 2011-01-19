class OrganizationsController < ApplicationController
  inherit_resources

  protected

  def collection
    @organizations ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
