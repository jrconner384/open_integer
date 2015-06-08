require File.expand_path '../../helpers/helper', __FILE__

describe '#divisors' do
  it 'throws a RuntimeError when calling #divisors on numbers less than 1' do
    err = -> { 0.divisors }.must_raise RuntimeError
    err.message.must_match 'Integers less than 1 do not have proper divisors.'
  end
end
