GithubDashboard::Application.routes.draw do
  root to: 'repositories#index'
  get '/repositories/:owner/:name', to: 'repositories#show', constraints: { name: /.*/ }
  get '/:owner/:name', to: 'repositories#show', constraints: { name: /.*/ }
end
