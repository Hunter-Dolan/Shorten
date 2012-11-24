Shrtr::Application.routes.draw do

	get "/" => redirect("http://wearemocha.com/")

	match "/new" => "url#new"

	get "/:slug" => "url#get", as: :url
end
