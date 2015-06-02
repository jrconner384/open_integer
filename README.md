OpenInteger
===========
OpenInteger is here to provide some niche functionality to the Integer class that doesn't come baked in. I have a single goal in mind: readability. It's one thing to know that _n!_ can be expressed in a single line as `(1..n).inject(:*)` but it's so much nicer (and clearer) to write `n.factorial`.

Getting the Gem
---------------
Add my [Gemfury repo](https://repo.fury.io/jrconner384/) to your sources (`gem sources -a https://repo.fury.io/jrconner384/`) and call `gem install open_integer`. The gem takes care of mixing itself into the Integer class so all you need to do is `require 'open_integer'` to gain access to all it has to offer.

I do have plans to publish this on [RubyGems](https://rubygems.org) once I have everything properly documented and tested. The good news is that I'm keeping up with the documentation. The bad is that I'm new to creating gems and not entirely fluent in testing Ruby code, yet. Stay tuned for the jump to RubyGems.

Changelog
---------
__Version 0.4.0__

_New method!_
- `#divisors` - Gets you the proper divisors of the number this is called on. A proper divisor is defined by Wolfram MathWorld as positive divisors of a value excluding that value itself.

_Updated implementations!_

These are based largely on me mistakenly treating factors and divisors as the same thing.
- `#factors`
 - Only returns or yields values greater than 1.
 - Now raises a `RuntimeError` if called on values less than 2.
- `#factor_of?` raises a `RuntimeError` if called on 0. Docs updated with this change.
- `#abundant?`, `#deficient?`, and `#perfect?` use the new `#divisors` method. Docs updated to reflect this change.

__Version 0.3.1__

_Bug fix!_

`#factors` now works correctly when called on `1`.

__Version 0.3.0__

_New method!_

- `#amicable_with?(other)` - A number _a_ is amicable with another number _b_ if the following conditions are met:
 - _a_ is not equal to _b_.
 - The sum of the factors of _a_ is equal to _b_.
 - The sum of the factors of _b_ is equal to _a_.

__Version 0.2.0__

_New methods!_

- `#abundant?` - An abundant number is one for which the sum of its proper divisors is greater than the number itself.
- `#deficient?` - A deficient number is one for which the sum of its proper divisors is less than the number itself.
- `#perfect?` - A perfect number is one for which the sum of its proper divisors exactly equals the number itself.

_Bug discovery!_

- See Issue #1. `0.factor_of(n)` causes a `ZeroDivisionError`

__Version 0.1.0__

I'm trying to keep to [semantic versioning](semver.org) which I haven't exactly done properly so far. I'm adding a new method, factors, though and it's a backwards compatible change so that means minor version bump. Details follow.

_New Methods_

- `#factors`: Returns an array of the factors of `self`. This is mainly refactored out of `#factor_pairs` which first identified the factors then created an array of factor pairs. It was messy and that brings us to patch-level changes.

_Implementation Changes_

- `#choose(k)`: removed uses of the informal "shriek" to refer to factorials in favor of vanilla flavored "factorial".
- `#factor_pairs`: now calls `#factors` instead of generating the collection of factors on its own.
