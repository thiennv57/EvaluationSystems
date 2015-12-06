class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
    @topic = @template.topics.build
    #@sub_topic = @topic.sub_topics.build
  end

  def create
    @template = Template.new template_params
    if @template.save
      flash[:success] = "Template was created successfully!"
      redirect_to templates_path
    else
      render :new
    end
  end

  def show
  end

  private
  def template_params
    params.require(:template).permit :name, :description, topics_attributes: [:id, :name, :description, :_destroy]
  end
end
