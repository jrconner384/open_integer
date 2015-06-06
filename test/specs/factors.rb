require File.expand_path '../../helpers/helper', __FILE__

describe Integer do
  it 'throws a RuntimeError when calling #factors on numbers less than 2' do
    err = -> { 1.factors }.must_raise RuntimeError
    err.message.must_match 'Integers less than 2 do not have proper factors.'
  end
end
