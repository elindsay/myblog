class FeelingsAndNeedsController < ApplicationController

  def index
    @head_feelings = Feeling.heads_only
    @head_needs = Need.heads_only
  end

  def create
    head_feeling_string = params[:head_feeling_string]
    feelings_string = params[:feelings_string]
    head_need_string = params[:head_need_string]
    needs_string = params[:needs_string]

    feelings_string.split(", ").each do |feeling|
      Feeling.create(name: feeling, header_feeling: head_feeling_string)
    end
    needs_string.split(", ").each do |need|
      logger.debug need*50
      n = Need.create(name: need, header_need: head_need_string)
      logger.debug n.errors.inspect
    end
    redirect_to feelings_and_needs_path
  end
end
