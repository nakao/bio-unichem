require 'helper'
require 'bio-unichem/unichem.rb'

class TestBioUnichem < Test::Unit::TestCase
  def test_src_id_chembl
    assert_equal(BioUniChem.src_id(:chembl), "1")
  end
end
