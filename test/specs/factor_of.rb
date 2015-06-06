require File.expand_path '../../helpers/helper', __FILE__

describe Integer do
  it 'throws a RuntimeError when calling 0.factor_of? n' do
    err = -> { 0.factor_of? 1 }.must_raise RuntimeError
    err.message.must_match 'Zero is not a factor of anything.'
  end
end
