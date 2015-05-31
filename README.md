Version 0.1.0
=============
I'm trying to keep to semantic versioning (semver.org) which I haven't exactly done properly so far. I'm adding a new method, factors, though and it's a backwards compatible change so that means minor version bump. Details follow.

New Methods
-----------
- `#factors`: Returns an array of the factors of `self`. This is mainly refactored out of `#factor_pairs` which first identified the factors then created an array of factor pairs. It was messy and that brings us to patch-level changes.

Implementation Changes
----------------------
- `#choose(k)`: removed uses of the informal "shriek" to refer to factorials in favor of vanilla flavored "factorial".
- `#factor_pairs`: now calls `#factors` instead of generating the collection of factors on its own.
