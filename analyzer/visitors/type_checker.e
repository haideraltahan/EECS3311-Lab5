note
	description: "Summary description for {TYPE_CHECKER}."
	author: "Jackie and You"
	date: "$Date$"
	revision: "$Revision$"

class
	TYPE_CHECKER

inherit
	VISITOR

create
	make

feature -- Status
	is_type_correct: BOOLEAN

feature -- Constructor
	make
		do
			is_type_correct := FALSE
		end

feature -- Commands for visiting composite structure
	visit_value_constant (e: VALUE_CONSTANT)
		do
			is_type_correct := TRUE
		end

	visit_addition (e: ADDITION)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_subtraction (e: SUBTRACTION)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_multiplication (e: MULTIPLICATION)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_division (e: DIVISION)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_equals (e: EQUALS)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			elseif attached {BOOLEAN_TYPE} eval_left.type as l  and attached {BOOLEAN_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_not_equals (e: NOT_EQUALS)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			elseif attached {BOOLEAN_TYPE} eval_left.type as l  and attached {BOOLEAN_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_greater_than (e: GREATER_THAN)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_greater_than_or_equals (e: GREATER_THAN_OR_EQUALS)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_less_than (e: LESS_THAN)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_less_than_or_equals (e: LESS_THAN_OR_EQUALS)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_TYPE} eval_left.type as l  and attached {NUMERICAL_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_conjunction (e: CONJUNCTION)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_TYPE} eval_left.type as l  and attached {BOOLEAN_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_disjunction (e: DISJUNCTION)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_TYPE} eval_left.type as l  and attached {BOOLEAN_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_implication (e: IMPLICATION)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_TYPE} eval_left.type as l  and attached {BOOLEAN_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_iff (e: IFF)
		local
			eval_left, eval_right: TYPE_CALCULATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_TYPE} eval_left.type as l  and attached {BOOLEAN_TYPE} eval_right.type as r then
				is_type_correct := TRUE
			end
		end

	visit_negation (e: NEGATION)
		local
			eval: EVALUATOR
		do
			create eval.make
			e.expr.accept (eval)
			if attached {BOOLEAN_VALUE} eval.value as v then
				is_type_correct := TRUE
			end
		end
end
