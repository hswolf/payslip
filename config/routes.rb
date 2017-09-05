Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'payslips#new'

  resource :payslips, only: [ :new] do
    post :create, defaults: { format: 'js' }
  end
end
