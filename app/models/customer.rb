class Customer < ActiveRecord::Base


	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |customers|
				csv << customers.attributes.values_at(*column_names)
			end
		end
	end
	def self.import(file)
		allowed_attributes = [ "property_name","occupancy_id","address_1" ,"address_2","city","state","zip"]
		CSV.foreach(file.path,headers: true) do |row|
			customers = find_by_id(row["id"]) || new
			
			customers.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
			customers.save
		end
	end	

end