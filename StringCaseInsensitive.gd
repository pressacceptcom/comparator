tool
class_name PressAccept_Comparator_StringCaseInsensitive

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
# Class                  : StringCaseInsensitive
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
# 1.0.0    12/29/2021    First Release
#

# ***************************
# | Public Static Functions |
# ***************************


# return the relationship between two strings in a case-insensitive manner
static func compare(
		a_str,
		b_str) -> int:

	if a_str is String and b_str is String:
		return a_str.nocasecmp_to(b_str)

	return PressAccept_Comparator_Comparator.compare(a_str, b_str)

# Godot binds static calls it appears at compile time or else static functions
# don't inherit, so we must redefine


# test whether two strings are equivalent in a case-insensitive manner
static func equals(
		a,
		b) -> bool:

	return compare(a, b) == \
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

	if value is String:
		return value.to_lower()
	
	return value

