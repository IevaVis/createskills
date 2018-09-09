Rails.application.routes.draw do
root "pages#home"
resources :parents
resources :teachers
resources :documents


get "teacher/sign_in" => "teachers_sessions#new", as: "teacher_sign_in"
post "teacher/sign_in" => "teachers_sessions#create"
delete "teacher/sign_out" => "teachers_sessions#destroy", via: :delete

get "parent/sign_in" => "parents_sessions#new", as: "parent_sign_in"
post "parent/sign_in" => "parents_sessions#create"
delete "parent/sign_out" => "parents_sessions#destroy", via: :delete

end
