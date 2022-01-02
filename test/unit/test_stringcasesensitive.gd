extends 'res://addons/gut/test.gd'

# |---------|
# | Imports |
# |---------|

# see test/Utilities.gd
var TestUtilities : Script = PressAccept_Comparator_Test_Utilities
# shorthand for our library class
var Comparator    : Script = PressAccept_Comparator_StringCaseSensitive

# |-------|
# | Tests |
# |-------|


func test_is_comparator() -> void:

	var object: PressAccept_Comparator_StringCaseSensitive = Comparator.new()

	var tests: Dictionary = {
		[ Comparator ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ object ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'test' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ Reference.new() ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'is_comparator'))


func test_compare() -> void:

	var tests: Dictionary = {
		[ 7, 6 ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.GREATER_THAN
			},
		[ 6, 6 ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.EQUAL
			},
		[ 6, 7 ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.LESS_THAN
			},
		[ 'c', 'b' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.GREATER_THAN
			},
		[ 'b', 'b' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.EQUAL
			},
		[ 'a', 'b' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.LESS_THAN
			},
		[ 'C', 'b' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.LESS_THAN
			},
		[ 'b', 'B' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.GREATER_THAN
			},
		[ 'A', 'b' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : Comparator.ENUM_RELATION.LESS_THAN
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'compare'))


func test_equals() -> void:

	var tests: Dictionary = {
		[ 7, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 6, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'c', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'b', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'b', 'B' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'B', 'B' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'equals'))


func test_less_than() -> void:

	var tests: Dictionary = {
		[ 5, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 6, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 7, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'a', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'b', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'c', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'C', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'b', 'B' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'A', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'less_than'))


func test_less_than_or_equal() -> void:

	var tests: Dictionary = {
		[ 5, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 6, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 7, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'a', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'b', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'c', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'C', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'b', 'B' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'A', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'less_than_or_equal'))


func test_greater_than() -> void:

	var tests: Dictionary = {
		[ 5, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 6, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 7, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'a', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'b', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'c', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'C', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'b', 'B' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'A', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'greater_than'))


func test_greater_than_or_equal() -> void:

	var tests: Dictionary = {
		[ 5, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 6, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 7, 6 ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'a', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'b', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'c', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'C', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			},
		[ 'b', 'B' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.TRUE
			},
		[ 'A', 'b' ]:
			{
				TestUtilities.ASSERTION: TestUtilities.FALSE
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'greater_than_or_equal'))


func test_transform() -> void:

	var tests: Dictionary = {
		[ 5 ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : 5
			},
		[ 'a' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : 'a'
			},
		[ 'A' ]:
			{
				TestUtilities.ASSERTION   : TestUtilities.EQUALS,
				TestUtilities.EXPECTATION : 'A'
			}
	}

	TestUtilities.batch(self, tests, funcref(Comparator, 'transform'))

