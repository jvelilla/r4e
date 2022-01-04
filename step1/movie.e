note
	description: "Object representing Movie data."
	date: "$Date$"
	revision: "$Revision$"

class
	MOVIE

create
	make

feature {NONE} --Implementation

	make (a_title: READABLE_STRING_GENERAL; a_price_code: INTEGER)
			-- Create an object Movie with title and price code.
		do
			title := a_title
			set_price_code (a_price_code)
		ensure
			title_set: title.same_string_general (a_title)
			price_code_set: price_code = a_price_code
		end

feature -- Access

	title: STRING_32

	price_code: INTEGER

feature -- Change Element

	set_price_code (a_price_code: INTEGER)
			-- Set `price_code` with `a_price_code`.
		do
			price_code := a_price_code
		ensure
			price_code_set: price_code = a_price_code
		end

feature -- Constants

	frozen CHILDRENS: INTEGER = 2
	frozen REGULAR: INTEGER = 0
	frozen NEW_RELEASE: INTEGER = 1
end
