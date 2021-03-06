[![Build Status](https://travis-ci.org/jrconner384/open_integer.svg?branch=open_CI)](https://travis-ci.org/jrconner384/open_integer)
[![Inline docs](http://inch-ci.org/github/jrconner384/open_integer.svg?branch=open_CI)](http://inch-ci.org/github/jrconner384/open_integer)
[![Coverage Status](https://coveralls.io/repos/jrconner384/open_integer/badge.svg?branch=open_CI)](https://coveralls.io/r/jrconner384/open_integer?branch=open_CI)
OpenInteger
===========
OpenInteger is "open" as in "open source" and "open classes". It's here to provide some niche functionality to the Integer class that doesn't come baked in.

I have a single goal in mind for this project: readability. It's one thing to know that _n!_ can be expressed in a single line as `(1..n).inject(:*)` but it's so much nicer (and clearer) to write `n.factorial`.

Getting the Gem
---------------
You've got two options until I publish the gem to RubyGems: add my [Gemfury repo](https://repo.fury.io/jrconner384/) and install from the command line or build the gem from source and install.

__From Gemfury__
- `gem install open_integer --source https://repo.fury.io/jrconner384/`

__Build it Yourself__
- Navigate to wherever you want to clone the repo.
- `git clone https://github.com/jrconner384/open_integer`
- `gem build open_integer.gemspec`
- `gem install open_integer-<version>.gem` where `<version>` is whatever version number the gem build process tacked on to the gem name.

__RubyGems__ (tentative)
- `gem install open_integer`

Changelog
---------
__Version 0.4.0__ (pre-release)

This is a fairly big milestone in this project's life, thanks mostly to me figuring out a few things about [minitest](https://github.com/seattlerb/minitest), [Travis CI](https://travis-ci.org/), and installing a gem locally without the need to publish it (trust me, that caused me some pain).

_minitest!_

I'm learning minitest. I've already started publishing some specs [here](test/specs) which, hopefully, will provide a measure of sanity. At a minimum, the specs will demonstrate when I get the math concepts wrong, which I expect to happen since I'm not a particularly strong mathematician.

To create a robust test suite, I've started using exceptions to more descriptively demonstrate failure conditions. This is to replace things like esoteric `NoMethodError`s and `ZeroDivisionError`s the runtime was (correctly) throwing with nicer messages describing _why_ something has failed.

_Travis!_

I'm now using Travis to keep the test suite running following each push to the repo. I got my first round of tests working as expected and I got Travis to successfully run the tests so now I've got a delightful green (for now) 'passing' badge.

_Fewer versions, just as many updates!_

At this stage, I intend to push out new versions much less frequently without reducing the frequency of commits to the code base. That'll mean that the head will be nominally unstable but I won't be hurtling towards ridiculous version numbers. I'm pretty sure that, at this rate, I'd have released v0.267.0 in the next couple of weeks.

_New methods!_
- `#divisors` - Gets you the proper divisors of the number this is called on. A proper divisor is defined by Wolfram MathWorld as positive divisors of a value excluding that value itself.
- `#lowest_prime_factor` - Works as read.

_Updated implementations!_

These are based largely on me mistakenly treating factors and divisors as the same thing.
- `#factors`
 - Only returns or yields values greater than 1.
 - Now raises a `RuntimeError` if called on values less than 2.
- `#factor_of?` raises a `RuntimeError` if called on 0. Docs updated with this change.
- `#abundant?`, `#deficient?`, and `#perfect?` use the new `#divisors` method. Docs updated to reflect this change.

__Version 0.3.1__

_Bug fix!_

`#factors` now ~~works correctly~~ does a different wrong thing when called on `1`.

_Apologies. Version 0.3.1 identifies 1 as a factor of 1 but, since my goal is to find proper factors, 1 doesn't have any factors and this version does not correctly demonstrate that._

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

I'm trying to keep to [semantic versioning](semver.org) which I haven't exactly done properly so far. I'm adding a new method, `#factors`, though and it's a backwards compatible change so that means minor version bump. Details follow.

_New Methods_

- `#factors`: Returns an array of the factors of `self`. This is mainly refactored out of `#factor_pairs` which first identified the factors then created an array of factor pairs. It was messy and that brings us to patch-level changes.

_Implementation Changes_

- `#choose(k)`: removed uses of the informal "shriek" to refer to factorials in favor of vanilla flavored "factorial".
- `#factor_pairs`: now calls `#factors` instead of generating the collection of factors on its own.
