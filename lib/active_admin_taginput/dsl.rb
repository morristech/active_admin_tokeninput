module ActiveAdminTaginput
  module DSL
  	def tag_autocomplete(options={})
  		collection_action :autocomplete, :method => :get do
  			collection = options[:collection].where("name ILIKE ?", "%#{params[:q]}%").order('lower(name) ASC').limit(10)
  		 	render :json => collection.as_json(:only => [:id, :name]), root: false
  		end
	end
  end
end