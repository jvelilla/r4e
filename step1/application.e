note
	description: "step1 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			create cs1.make ("Joe")
			cs1.set_item (movie_to_rent (Movie1, 1))
			cs1.set_item (movie_to_rent (Movie2, 1))
			cs1.set_item (movie_to_rent (Movie3, 3))
			cs1.set_item (movie_to_rent (Movie4, 4))
			print (cs1.statement)
		end

	cs1: CUSTOMER

	movie_to_rent (a_movie: MOVIE; a_days: INTEGER): RENTAL
		do
			create Result.make (a_movie, a_days)
		end


	Movie1: MOVIE
		do
			create Result.make ("Movie1", {MOVIE}.REGULAR)
		end

	Movie2: MOVIE
		do
			create Result.make ("Movie2", {MOVIE}.REGULAR)
		end

	Movie3: MOVIE
		do
			create Result.make ("Movie3", {MOVIE}.REGULAR)
		end

	Movie4: MOVIE
		do
			create Result.make ("Movie4", {MOVIE}.NEW_RELEASE)
		end

	Movie5: MOVIE
		do
			create Result.make ("Movie5", {MOVIE}.CHILDRENS)
		end

	Movie6: MOVIE
		do
			create Result.make ("Movie6", {MOVIE}.CHILDRENS)
		end

	Movie7: MOVIE
		do
			create Result.make ("Movie7", {MOVIE}.NEW_RELEASE)
		end

end
