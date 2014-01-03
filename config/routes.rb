Resolutions::Application.routes.draw do
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'resolutions#index'
    devise_for :users, path_names: { :sign_in => 'login', :sign_out => 'logout', :registration => 'register', :sign_up => 'sign_up' }, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    resource :users, except: [:new, :create, :destroy], path: :profile, as: :profile do
      get 'resolutions'
    end
    resources :resolutions

    # match "/users/auth/:provider",
    #      :constraints => { :provider => /A(google|facebook)z/ },
    #      :to => "devise/omniauth_callbacks#passthru",
    #      :as => :omniauth_authorize,
    #      :via => [:get, :post]

    # get '/auth/:provider' => 'users/omniauth_callbacks#passthru', :as => :user_omniauth_authorize
    # TheComments routes
    concern   :user_comments,  TheComments::UserRoutes.new
    concern   :admin_comments, TheComments::AdminRoutes.new
    resources :comments, concerns:  [:user_comments, :admin_comments]
  # end
end
