class UrlController < ApplicationController

	def get
		objects = Url.where(slug: params[:slug])
		if objects.count == 0
			render json: {status_code: 404}, status: 404
		else
			redirect_to objects.first.url
		end
	end

	def new
		if params[:url].nil?
			render json: {error: 406, status_code: "Not Acceptable"}, status: 406
		else
			object = Url.new(url: params[:url])
			object.save!

			render json: {shorturl: url_for(object)}
		end
	end

end
