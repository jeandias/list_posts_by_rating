Rails.application.routes.draw do
  resources :posts
  put 'upvote/:post_id', to: 'posts#upvote'
  put 'downvote/:post_id', to: 'posts#downvote'
end
