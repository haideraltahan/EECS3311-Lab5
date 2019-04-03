note
	description: "Summary description for {EVALUATOR}."
	author: "Jackie and You"
	date: "$Date$"
	revision: "$Revision$"

class
	EVALUATOR

inherit
	VISITOR

create
	make

feature -- Status
	value: EXPRESSION_VALUE

feature -- Constructor
	make
		do
			create {NIL} value
		end

feature {NONE} -- Helper Queries

	is_equal_within (expected, actual: REAL_64): BOOLEAN
			-- Is `expected' equal to `actual' within 0.001 tolerance?
		do
			Result := (expected - actual).abs <= 0.001
		end

feature -- To Do: Implement Commands for visiting composite structure
	visit_value_constant (e: VALUE_CONSTANT)
		do
			value := create {NUMERICAL_VALUE}.make (e.value)
		end

	visit_addition (e: ADDITION)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {NUMERICAL_VALUE}.make (r.value + l.value)
			end
		end

	visit_subtraction (e: SUBTRACTION)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {NUMERICAL_VALUE}.make (l.value - r.value)
			end
		end

	visit_multiplication (e: MULTIPLICATION)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {NUMERICAL_VALUE}.make (r.value * l.value)
			end
		end

	visit_division (e: DIVISION)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {NUMERICAL_VALUE}.make (l.value / r.value)
			end
		end

	visit_equals (e: EQUALS)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (is_equal_within (l.value, r.value))
			elseif attached {BOOLEAN_VALUE} eval_left.value as l  and attached {BOOLEAN_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (l.value ~ r.value)
			end
		end

	visit_not_equals (e: NOT_EQUALS)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (not is_equal_within (l.value, r.value))
			elseif attached {BOOLEAN_VALUE} eval_left.value as l  and attached {BOOLEAN_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (l.value ~ r.value)
			end
		end

	visit_greater_than (e: GREATER_THAN)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make ((not is_equal_within (l.value, r.value)) and l.value > r.value)
			end
		end

	visit_greater_than_or_equals (e: GREATER_THAN_OR_EQUALS)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (( is_equal_within (l.value, r.value)) or l.value > r.value)
			end
		end

	visit_less_than (e: LESS_THAN)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make ((not is_equal_within (l.value, r.value)) and l.value < r.value)
			end
		end

	visit_less_than_or_equals (e: LESS_THAN_OR_EQUALS)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {NUMERICAL_VALUE} eval_left.value as l  and attached {NUMERICAL_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (( is_equal_within (l.value, r.value)) or l.value < r.value)
			end
		end

	visit_conjunction (e: CONJUNCTION)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_VALUE} eval_left.value as l  and attached {BOOLEAN_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (l.value and r.value)
			end
		end

	visit_disjunction (e: DISJUNCTION)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_VALUE} eval_left.value as l  and attached {BOOLEAN_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (l.value or r.value)
			end
		end

	visit_implication (e: IMPLICATION)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_VALUE} eval_left.value as l  and attached {BOOLEAN_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make (l.value implies r.value)
			end
		end

	visit_iff (e: IFF)
		local
			eval_left, eval_right: EVALUATOR
		do
			create eval_left.make
			create eval_right.make
			e.left.accept (eval_left)
			e.right.accept (eval_right)
			if attached {BOOLEAN_VALUE} eval_left.value as l  and attached {BOOLEAN_VALUE} eval_right.value as r then
				value := create {BOOLEAN_VALUE}.make ((l.value and r.value) or (not l.value and not r.value))
			end
		end

	visit_negation (e: NEGATION)
		local
			eval: EVALUATOR
		do
			create eval.make
			e.expr.accept (eval)
			if attached {BOOLEAN_VALUE} eval.value as v then
				value := create {BOOLEAN_VALUE}.make (not v.value)
			end
		end
end
