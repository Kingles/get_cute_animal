#require "get_cute_animal/version"
require 'flickraw'
require 'debugger'


module GetCuteAnimal
	def self.get
		FlickRaw.api_key="d1d77286c488bf0cb85c0a144d46781d"
		FlickRaw.shared_secret="1af79ef86cffd4c8"
		photos = get_valid_group_photos
		my_photo = photos.to_a.sample
		sizes = flickr.photos.getSizes photo_id: my_photo.id
		original = sizes.find {|s| s.label == 'Original' }
		original ||= sizes.to_a.last
		puts original.label
		puts my_photo.ownername
		puts my_photo.dateadded
		puts original.source      # => "800" -- may fail if they have no original marked image
	end
	def self.get_valid_group_photos
		list = { first: ["cute", "adorable", "fluffy"], second: ["baby animals", "animals", "kittens", "puppies", "bunnies", "ducks", 'doggies', 'dogs'] }
		results = flickr.groups.search text: list[:first].sample + ' ' + list[:second].sample 
		get_photos(results)
	end
	def self.get_photos(results)
		begin 
			flickr.groups.pools.getPhotos group_id: results.to_a.sample.nsid
		rescue
			puts "bad group.. trying again. error was #{e}"
			get_valid_group_photos
		end
	end
end