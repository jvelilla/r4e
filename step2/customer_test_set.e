note
	description: "[
			Eiffel tests that can be executed by testing tool.
		]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	CUSTOMER_TEST_SET

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		select
			default_create
		end

	EQA_COMMONLY_USED_ASSERTIONS
		rename
			assert as assert_cua,
			default_create as df_create_cua
		end

feature {NONE} -- Events

	on_prepare
			-- Called after all initializations in `default_create'.
		do
			create cs1.make ("Joe")
			cs1.set_item (movie_to_rent (Movie1, 1))
			cs1.set_item (movie_to_rent (Movie2, 1))
			cs1.set_item (movie_to_rent (Movie3, 3))
			cs1.set_item (movie_to_rent (Movie4, 4))

			create cs2.make ("Mike")
			cs2.set_item (movie_to_rent (Movie7, 4))
			cs2.set_item (movie_to_rent (Movie4, 2))

			create cs3.make ("Jorgue")
			cs3.set_item (movie_to_rent (Movie5, 3))
			cs3.set_item (movie_to_rent (Movie6, 1))
			cs3.set_item (movie_to_rent (Movie7, 2))

			create cs4.make ("Andrea")
			cs4.set_item (movie_to_rent (Movie1, 1))
			cs4.set_item (movie_to_rent (Movie2, 1))
			cs4.set_item (movie_to_rent (Movie3, 3))
			cs4.set_item (movie_to_rent (Movie4, 4))
		end

	cs1: CUSTOMER
	cs2: CUSTOMER
	cs3: CUSTOMER
	cs4: CUSTOMER

feature -- Test routines

	test_statement_cs1
			-- New test routine
		do
			assert_strings_equal ("Expected statement cs1", cs1_statement_str, cs1.statement)
		end

	test_statement_cs2
			-- New test routine
		do
			assert_strings_equal ("Expected statement cs2", cs2_statement_str, cs2.statement)
		end

	test_statement_cs3
			-- New test routine
		do
			assert_strings_equal ("Expected statement cs3", cs3_statement_str, cs3.statement)
		end

	test_statement_cs4
			-- New test routine
		do
			assert_strings_equal ("Expected statement cs4", cs4_statement_str, cs4.statement)
		end

feature -- Expected Statements

	cs1_statement_str: STRING_32 = "Rental record for Joe%N%TMovie1%T2%N%TMovie2%T2%N%TMovie3%T3.5%N%TMovie4%T12%NAmount owed is 19.5%NYou earned  5 frequent renter points"
	cs2_statement_str: STRING_32 = "Rental record for Mike%N%TMovie7%T12%N%TMovie4%T6%NAmount owed is 18%NYou earned  4 frequent renter points"
	cs3_statement_str: STRING_32 = "Rental record for Jorgue%N%TMovie5%T1.5%N%TMovie6%T1.5%N%TMovie7%T6%NAmount owed is 9%NYou earned  4 frequent renter points"
	cs4_statement_str: STRING_32 = "Rental record for Andrea%N%TMovie1%T2%N%TMovie2%T2%N%TMovie3%T3.5%N%TMovie4%T12%NAmount owed is 19.5%NYou earned  5 frequent renter points"

feature -- Movie Objects

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

