class AsanasApp < Sinatra::Base
	#GET - set root route
	get '/' do
		# "This is the root route"
		@asanas = Asana.all
		erb :index
	end

	#GET - get all the asanas in index
	get '/asanas' do
		@asanas = Asana.all
		erb :index
	end

	#GET - provide form to get info for new asana (user experience)
	get '/asanas/new' do
		@asana = Asana.new #instance of new, empty Asana object
		erb :new
	end

	#POST - create new asana and add to index
	post '/asanas' do
		@asana = Asana.create(params[:asana])
		@asana.save #is this step necessary if using .create which is .new and .save in one step???
		redirect '/'
	end

	#GET - get info for specific asana
	get '/asanas/:id' do
		@asanas = Asana.all
		@asanas = Asana.find(params[:id])
		@asana.name
	end

	#DELETE - deletes specific asana from index
	# delete '/asanas/:id' do
	# 	@asana = Asana.find(params[:id])
	# 	@asana.destroy
	# 	redirect '/asanas'
	# end
end