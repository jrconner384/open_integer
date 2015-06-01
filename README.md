Version 0.2.0
=============
New methods!
------------
- `#abundant?` - An abundant number is one for which the sum of its proper divisors is greater than the number itself.
- `#deficient?` - A deficient number is one for which the sum of its proper divisors is less than the number itself.
- `#perfect?` - A perfect number is one for which the sum of its proper divisors exactly equals the number itself.

Bug discovery!
--------------
- See Issue #1. `0.factor_of(n)` causes a `ZeroDivisionError`

Version 0.1.0
=============
I'm trying to keep to [semantic versioning](semver.org) which I haven't exactly done properly so far. I'm adding a new method, factors, though and it's a backwards compatible change so that means minor version bump. Details follow.

New Methods
-----------
- `#factors`: Returns an array of the factors of `self`. This is mainly refactored out of `#factor_pairs` which first identified the factors then created an array of factor pairs. It was messy and that brings us to patch-level changes.

Implementation Changes
----------------------
- `#choose(k)`: removed uses of the informal "shriek" to refer to factorials in favor of vanilla flavored "factorial".
- `#factor_pairs`: now calls `#factors` instead of generating the collection of factors on its own.
