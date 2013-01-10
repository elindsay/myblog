class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    if current_user
      @entry = Entry.new(params[:entry].merge(user: current_user))
      if @entry.save
        redirect_to entry_path(@entry)
      else
        render "new"
      end
    else
      redirect_to login_path, flash: "You must login to create this"
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.user == current_user
      if @entry.update_attributes(params[:entry])
        redirect_to entry_path(@entry)
      else
        render "edit"
      end
    else
      redirect_to entry_path(@entry), notice: "You can't edit this"
    end
  end
end
