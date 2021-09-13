Rails.application.routes.draw do
  concern :active_scaffold_association, ActiveScaffold::Routing::Association.new
  concern :active_scaffold, ActiveScaffold::Routing::Basic.new(association: true)
  resources :child_models, concerns: :active_scaffold
  resources :main_models, concerns: :active_scaffold

  root :to => redirect('/main_models')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
