class Admin::TagsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path
  end
  
  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to '/admin/tags'
  end
  
  
  private
  def tag_params
    params.require(:tag).permit(:name)
  end
  
end
