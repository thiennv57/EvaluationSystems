class TopicsController < ApplicationController
  def edit
    @topic = Topic.find params[:id]
  end

  def update
    @topic = Topic.find params[:id]
    if @topic.update topic_params
      flash[:success] = "Topic was updated successfully!"
      redirect_to templates_path
    else
      render :edit
    end
  end

  private
  def topic_params
    params.require(:topic).permit :name, :description, sub_topics_attributes: [:id, :name, :description, :_destroy]
  end
end
