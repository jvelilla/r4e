note
	description: "Object representing a customer renting a movie."
	date: "$Date$"
	revision: "$Revision$"

class
	RENTAL

create
	make

feature	{NONE} -- Initialization

	make (a_movie: MOVIE; a_days_rented: INTEGER)
			-- Create a Rental objects with a movie and days rented.
		do
			movie := a_movie
			days_rented := a_days_rented
		ensure
			movie_set: movie = a_movie
			days_rented_set: days_rented = a_days_rented
		end


feature -- Access

	movie: MOVIE
		-- the current movie.

	days_rented: INTEGER
		-- days to be rented.

end
