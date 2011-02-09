class GovernmentLevelsController < ApplicationController
  inherit_resources

  protected

  def collection
    @government_levels ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
