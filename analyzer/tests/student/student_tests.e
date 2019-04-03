note
	description: "Summary description for {STUDENT_TESTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT_TESTS
inherit
	ES_TEST
	redefine
		setup
	end
create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create parser.make
			add_boolean_case (agent t1)
			add_boolean_case (agent t2)
			add_boolean_case (agent t3)
			add_boolean_case (agent t4)
		end
feature
	parser: ANALYZER_PARSER

	setup
			-- Re-create the parser before executing each test feature.
		do
			parser.make
		end

	is_equal_within (expected, actual: REAL_64): BOOLEAN
		do
			Result := (expected - actual).abs <= 0.001
		end



feature
	t1: BOOLEAN
		local
			v: EVALUATOR
		do
			comment ("t1: 3.23 + 4 evaluates to 7.23")
			parser.parse_string ("3.23 + 4")
			Result := parser.error_count = 0
			check Result end

			create v.make
			parser.expression.accept (v)
			check attached {NUMERICAL_VALUE} v.value as number then
				Result := is_equal_within (7.23, number.value)
			end
		end

	t2: BOOLEAN
		local
			v: EVALUATOR
		do
			comment ("t2: (3.23 + 4) * 3 = 22 evaluates to false")

			parser.parse_string ("(3.23 + 4) * 3 = 22")
			Result := parser.error_count = 0
			check Result end

			create v.make
			parser.expression.accept (v)
			check attached {BOOLEAN_VALUE} v.value as bool then
				Result := bool.value = false
			end
		end


	t3: BOOLEAN
		local
			v: TYPE_CHECKER
		do
			comment ("test3: (23.4 * (34.04 + 28.9)) is type correct")

			parser.parse_string ("(23.4 * (34.04 + 28.9))")
			Result := parser.error_count = 0
			check Result end

			create v.make
			parser.expression.accept (v)
			Result := v.is_type_correct
		end

	t4: BOOLEAN
		local
			v: TYPE_CHECKER
		do
			comment ("test4: (3 - 4) + (23 + 34) is type correct")

			parser.parse_string ("(3 - 4) + (23 + 34)")
			Result := parser.error_count = 0
			check Result end

			create v.make
			parser.expression.accept (v)
			Result :=  v.is_type_correct
		end
end
