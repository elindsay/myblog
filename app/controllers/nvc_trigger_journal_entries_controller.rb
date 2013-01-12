class NvcTriggerJournalEntriesController < ApplicationController
  def index
    @nvc_trigger_entries = current_user.nvc_trigger_journal_entries
  end

  def show
    @nvc_trigger_entry = NvcTriggerJournalEntry.find(params[:id])
    if @nvc_trigger_entry.user.id != current_user.id
      redirect_to nvc_trigger_journal_entries_path, flash: "This is not your post"
    end
  end

  def new
    @nvc_trigger_entry = NvcTriggerJournalEntry.new
  end

  def create
    if current_user
      @nvc_trigger_entry = NvcTriggerJournalEntry.new(params[:nvc_trigger_journal_entry].merge(user: current_user))
      if @nvc_trigger_entry.save
        redirect_to nvc_trigger_journal_entry_path(@nvc_trigger_entry)
      else
        render "new"
      end
    else
      redirect_to login_path, flash: "You must login to create this"
    end
  end

  def edit
    @nvc_trigger_entry = NvcTriggerJournalEntry.find(params[:id])
  end

  def update
    @nvc_triger_entry = NvcTriggerJournalEntry.find(params[:id])
    if @nvc_trigger_entry.user == current_user
      if @nvc_trigger_entry.update_attributes(params[:nvc_trigger_journal_entry])
        redirect_to nvc_trigger_journal_entry_path(@nvc_trigger_entry)
      else
        render "edit"
      end
    else
      redirect_to nvc_trigger_journal_entry_path(@nvc_trigger_entry), notice: "You can't edit this"
    end
  end
end
