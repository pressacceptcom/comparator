tool
class_name PressAccept_Comparator_Dictionary

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
# Class                  : Dictionary
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

	return 'res://addons/PressAccept/Comparator/Dictionary.gd'


# return the relationship between two strings in a case-insensitive manner
static func compare(
		a_dict,
		b_dict,
		by_ref: bool = false) -> int:

	if a_dict is Dictionary and b_dict is Dictionary:
		var Comparator: Script = PressAccept_Comparator_Comparator
		var Comparable: Script = \
			load('res://addons/PressAccept/Utilizer/Mixins/Comparable.gd') as Script

		var size        : int = a_dict.size()
		var target_size : int = b_dict.size()

		if size == target_size \
				and _contains_all(a_dict.keys(), b_dict.keys(), by_ref):
			for key in a_dict:
				var b_key = key
				if not by_ref and Comparable:
					for _key in b_dict:
						if Comparable.is_comparable(b_key, _key) \
								and Comparable.compare(b_key, _key) == \
									Comparator.ENUM_RELATION.EQUAL:
							b_key = _key
							break

				if not by_ref \
						and a_dict[key] is Array \
						and b_dict[b_key] is Array:
					var comparison = \
						load('res://addons/PressAccept/Comparator/Array.gd') \
							.compare(a_dict[key], b_dict[b_key])

					if comparison != Comparator.ENUM_RELATION.EQUAL:
						return comparison
				elif not by_ref \
						and a_dict[key] is Dictionary \
						and b_dict[b_key] is Dictionary:
					var comparison = compare(a_dict[key], b_dict[b_key])

					if comparison != Comparator.ENUM_RELATION.EQUAL:
						return comparison
				elif Comparable \
						and Comparable \
							.is_comparable(a_dict[key], b_dict[b_key]):
					# comparison can be Comparable.STR_UNCOMPARABLE
					var comparison = \
						Comparable.compare(a_dict[key], b_dict[b_key], by_ref)

					if comparison != Comparator.ENUM_RELATION.EQUAL:
						return comparison
				elif a_dict[key] != b_dict[b_key]:
					return Comparator.ENUM_RELATION.LESS_THAN

		elif size > target_size:
			return Comparator.ENUM_RELATION.GREATER_THAN
		else:
			return Comparator.ENUM_RELATION.LESS_THAN

		return Comparator.ENUM_RELATION.EQUAL

	return PressAccept_Comparator_Comparator.compare(a_dict, b_dict)

# Godot binds static calls it appears at compile time or else static functions
# don't inherit, so we must redefine


# test whether two strings are equivalent in a case-insensitive manner
static func equals(
		a,
		b,
		by_ref: bool = false) -> bool:

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

	return PressAccept_Normalizer_Normalizer.normalize_to_dict(value)


# ****************************
# | Private Static Functions |
# ****************************


# does target_arr contain all elements of comparison_arr?
static func _contains_all(
		target_arr     : Array,
		comparison_arr : Array,
		by_ref         : bool = false) -> bool:

	var Comparator: Script = PressAccept_Comparator_Comparator
	var Comparable: Script = \
			load('res://addons/PressAccept/Utilizer/Mixins/Comparable.gd') as Script

	for comparison in comparison_arr:
		if Comparable:
			var _contains: bool = false
			for target in target_arr:
				if Comparable.is_comparable(comparison, target) \
					and Comparable.compare(comparison, target, by_ref) == \
						Comparator.ENUM_RELATION.EQUAL:
					_contains = true
			if not _contains:
				return false
		elif not comparison in target_arr:
			return false

	return true

