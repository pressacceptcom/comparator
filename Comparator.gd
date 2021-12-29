tool
class_name PressAccept_Comparator_Comparator

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
# Class                  : Comparator
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

# ****************
# | Enumerations |
# ****************

# indicates that A is <relationship> than/to B in: A <relationship> B
enum ENUM_RELATION {
	LESS_THAN = -1,
	EQUAL = 0,
	GREATER_THAN = 1
}

# *************
# | Constants |
# *************

const STR_COMPARE_METHOD: String = 'compare'

# ***************************
# | Public Static Functions |
# ***************************


# tests whether an object or Script has a 'compare' method
static func is_comparator(
		type) -> bool:

	if not type is Object:
		return false

	return (type is Script \
				and PressAccept_Typer_ObjectInfo. \
						script_has_method(type, STR_COMPARE_METHOD)) \
			or (type.has_method(STR_COMPARE_METHOD))


# return the relationship between two entities
static func compare(
		a,
		b) -> int:

	if a > b:
		return ENUM_RELATION.GREATER_THAN
	elif a < b:
		return ENUM_RELATION.LESS_THAN
	else:
		return ENUM_RELATION.EQUAL


# test whether two entities are equivalent
static func equals(
		a,
		b) -> bool:

	return compare(a, b) == ENUM_RELATION.EQUAL


# test whether a is less than b
static func less_than(
		a,
		b) -> bool:

	return compare(a, b) == ENUM_RELATION.LESS_THAN


# test whether a is less than or equal to b
static func less_than_or_equal(
		a,
		b) -> bool:

	return compare(a, b) == ENUM_RELATION.LESS_THAN \
		or compare(a, b) == ENUM_RELATION.EQUAL


# test whether a is greater than b
static func greater_than(
		a,
		b) -> bool:

	return compare(a, b) == ENUM_RELATION.GREATER_THAN


# test whether a is greater than or equal to b
static func greater_than_or_equal(
		a,
		b) -> bool:

	return compare(a, b) == ENUM_RELATION.GREATER_THAN \
		or compare(a, b) == ENUM_RELATION.EQUAL


# normalize a value in relation to the comparison method
static func transform(
		value):

	return value

