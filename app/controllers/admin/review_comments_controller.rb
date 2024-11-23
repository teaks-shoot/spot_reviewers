class Admin::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'  
    
  def destroy
    ReviewComment.find(params[:id]).destroy
    redirect_to admin_review_path(params[:review_id])
  end

end
