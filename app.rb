class AsanasApp < Sinatra::Base
	#GET - set root route
	get '/' do
		# "This is the root route"
		erb :home
	end

	#GET - get all the asanas in index
	get '/asanas' do
		@asanas = Asana.all
		erb(:"asanas/index")
	end

	#GET - provide form to get info for new asana (user experience)
	get '/asanas/new' do
		@asana = Asana.new #instance of new, empty Asana object
		erb(:"asanas/new")
	end

	#POST - create new asana and add to index
	post '/asanas' do
		@asana = Asana.create(params[:asana])
		@asana.save #is this step necessary if using .create which is .new and .save in one step???
		redirect('/asanas')
	end

	#GET - get/show info for specific asana
	get '/asanas/:id' do
		@asana = Asana.find(params[:id])
		erb(:"asanas/show")
	end

	#GET - provides form to edit info for specific asana (user experience)
	get '/asanas/:id/edit' do
		@asana = Asana.find(params[:id])
		erb(:"asanas/edit")
	end

	#POST - updates info for specific asana
	patch '/asanas/:id' do
		@asana = Asana.find(params[:id])
		if @asana.update_attributes(params[:asana])
			redirect("/asanas/#{@asana.id}")
		else
			erb(:"asanas/edit")
		end
	end

	#DELETE - deletes specific asana from index
	delete '/asanas/:id' do
		@asana = Asana.find(params[:id])
		@asana.destroy
		redirect('/asanas')
	end
end