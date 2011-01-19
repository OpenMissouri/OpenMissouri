class DataSetsController < ApplicationController
  inherit_resources

  protected

  def collection
    @data_sets ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
