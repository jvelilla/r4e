note
	description: "Ojbect representing a Customer of the Store."
	date: "$Date$"
	revision: "$Revision$"

class
	CUSTOMER

create
	make

feature {NONE} --Implementation

	make (a_name: READABLE_STRING_GENERAL)
		do
			name := a_name
			create rentals.make (0)
			rentals.compare_objects
		ensure
			name_set: name.same_string_general (a_name)
			rentals_empty: rentals.is_empty
		end

feature -- Access

	name: STRING_32
			-- customer's name

	rentals: ARRAYED_LIST [RENTAL]
			-- customer's list of rentals.

feature -- Change Element

	set_item (a_rental: RENTAL)
			-- Add `a_rental` to list rentals.
		do
			rentals.force (a_rental)
		ensure
			has_item: rentals.has (a_rental)
		end

feature -- Operations

	statement: STRING_32
		local
			total_amount: REAL_64
			frequent_renter_points: INTEGER
			this_amount: REAL_64
			item: RENTAL
		do
			Result := "Rental record for " + name + "%N"
			across rentals as ic
			loop
				this_amount := 0
				item := ic.item

					-- determine amounts for each  line
				inspect item.movie.price_code
				when {MOVIE}.REGULAR then
					this_amount := this_amount + 2
					if item.days_rented > 2 then
						this_amount := this_amount + (item.days_rented - 2) * 1.5
					end
				when {MOVIE}.NEW_RELEASE then
					this_amount := this_amount + item.days_rented * 3
				when {MOVIE}.CHILDRENS then
					this_amount := this_amount + 1.5
					if item.days_rented > 3 then
						this_amount := this_amount + (item.days_rented - 3) * 1.5
					end
				end
					-- add frequent renter point.
				frequent_renter_points := frequent_renter_points + 1
					-- add bonus for a two day new release rental.
				if item.movie.price_code = {MOVIE}.NEW_RELEASE and then
					item.days_rented > 1 then
					frequent_renter_points := frequent_renter_points + 1
				end

					-- Show figures for this rental
				Result.append ("%T" +item.movie.title + "%T" + this_amount.out + "%N")
				total_amount := total_amount + this_amount
			end

				-- add footer lines
			Result.append ("Amount owed is " + total_amount.out + "%N")
			Result.append ("You earned  " + frequent_renter_points.out + " frequent renter points")
		end
end
