class UserTagsController < ApplicationController
  def new
    @user_tag = UserTag.new
    topic_ids = params[:elementIds].split(',')
    @topics = topic_ids.map { |id| Topic.find(id) }
  end

  def create_tags
    tag_ids = params[:elementIds].split(',')
    tag_ids.each do |id|
      UserTag.create!(user_id: current_user.id, tag_id: id.to_i)
    end

    raise
    # redirect_to user_tag_path(user_tag)
  end

  def destroy
    user_tag = UserTag.find(params[:id])
    user_tag.destroy

    # redirect_to user_tag_path
  end

  private

  def user_tag_params
    params.require(:user_tag).permit(:topic_id, :user_id)
  end
end