tool
class_name PressAccept_Comparator_Array

extends PressAccept_Comparator_Comparator

# |=========================================|
# |                                         |
# |         Press Accept: Comparator        |
# | Encapsulated Comparison Logic For Godot |
# |                                         |
# |=========================================|
#
# |------------------|
# | Meta Information |
# |------------------|
#
# Organization Namespace : PressAccept
# Package Namespace      : Comparator
# Class                  : Array
#
# Organization        : Press Accept
# Organization URI    : https://pressaccept.com/
# Organization Social : @pressaccept
#
# Author        : Asher Kadar Wolfstein
# Author URI    : https://wunk.me/ (Personal Blog)
# Author Social : https://incarnate.me/members/asherwolfstein/
#                 @asherwolfstein (Twitter)
#                 https://ko-fi.com/asherwolfstein
#
# Copyright : Press Accept: Conductor © 2021 The Novelty Factor LLC
#                 (Press Accept, Asher Kadar Wolfstein)
# License   : Proprietary. All Rights Reserved.
#
# |-----------|
# | Changelog |
# |-----------|
#

# ***************************
# | Public Static Functions |
# ***************************


# return our script path
static func __get_script() -> String:

	return 'res://addons/PressAccept/Comparator/Array.gd'


# return the relationship between two strings in a case-insensitive manner
static func compare(
		a_arr,
		b_arr,
		by_ref: bool = false) -> int:

	if a_arr is Array and b_arr is Array:
		var Comparator: Script = PressAccept_Comparator_Comparator
		var Comparable: Script = \
			load('res://addons/PressAccept/Utilizer/Mixins/Comparable.gd') as Script

		var size        : int = a_arr.size()
		var target_size : int = b_arr.size()

		if size == target_size:
			for i in range(size):
				if not by_ref and a_arr[i] is Array and b_arr[i] is Array:
					var comparison = compare(a_arr[i], b_arr[i])
					
					if comparison != Comparator.ENUM_RELATION.EQUAL:
						return comparison
				elif not by_ref \
						and a_arr[i] is Dictionary \
						and b_arr[i] is Dictionary:
					var comparison = \
						load('res://addons/PressAccept/Comparator/Dictionary.gd') \
							.compare(a_arr[i], b_arr[i])
					
					if comparison != Comparator.ENUM_RELATION.EQUAL:
						return comparison
				elif Comparable \
						and Comparable.is_comparable(a_arr[i], b_arr[i]):
					# comparison can be Comparable.STR_UNCOMPARABLE
					var comparison = \
						Comparable.compare(a_arr[i], b_arr[i], by_ref)

					if comparison != Comparator.ENUM_RELATION.EQUAL:
						return comparison
				elif a_arr[i] != b_arr[i]:
					return Comparator.ENUM_RELATION.LESS_THAN

		elif size > target_size:
			return Comparator.ENUM_RELATION.GREATER_THAN
		else:
			return Comparator.ENUM_RELATION.LESS_THAN

		return Comparator.ENUM_RELATION.EQUAL

	return PressAccept_Comparator_Comparator.compare(a_arr, b_arr, by_ref)

# Godot binds static calls it appears at compile time or else static functions
# don't inherit, so we must redefine


# test whether two strings are equivalent in a case-insensitive manner
static func equals(
		a,
		b,
		by_ref = false) -> bool:

	return compare(a, b, by_ref) == \
		PressAccept_Comparator_Comparator.ENUM_RELATION.EQUAL


# test whether a is less than b in a case-insensitive manner
static func less_than(
		a,
		b) -> bool:

	return compare(a, b) == \
		PressAccept_Comparator_Comparator.ENUM_RELATION.LESS_THAN


# test whether a is less than or equal to b in a case-insensitive manner
static func less_than_or_equal(
		a,
		b) -> bool:

	return compare(a, b) == \
			PressAccept_Comparator_Comparator.ENUM_RELATION.LESS_THAN \
		or compare(a, b) == \
			PressAccept_Comparator_Comparator.ENUM_RELATION.EQUAL


# test whether a is greater than b in a case-insensitive manner
static func greater_than(
		a,
		b) -> bool:

	return compare(a, b) == \
		PressAccept_Comparator_Comparator.ENUM_RELATION.GREATER_THAN


# test whether a is greater than or equal to b in a case-insensitive manner
static func greater_than_or_equal(
		a,
		b) -> bool:

	return compare(a, b) == \
			PressAccept_Comparator_Comparator.ENUM_RELATION.GREATER_THAN \
		or compare(a, b) == \
			PressAccept_Comparator_Comparator.ENUM_RELATION.EQUAL


# normalize a value in relation to comparison method
#
# after two values are passed through this function they can be compared
# against each other as if they were being compared in a case-insensitive manner
static func transform(
		value):

	return PressAccept_Normalizer_Normalizer.normalize_to_array(value)

