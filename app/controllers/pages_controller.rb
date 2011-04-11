class PagesController < ApplicationController
  inherit_resources

  protected

  def collection
    @pages ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
