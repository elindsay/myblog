Myblog::Application.routes.draw do
  root to: "entries#index"

  get "log_out" => "sessions#destroy", as: "log_out"
  get "log_in" => "sessions#new", as: "log_in"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :entries
  resources :nvc_trigger_journal_entries
end
