require 'helper'
require 'bio-unichem/unichem.rb'

class TestBioUnichem < Test::Unit::TestCase
  def test_UniChem
    assert(Bio::UniChem)
  end

  def test_REST
    assert(Bio::UniChem::REST)
  end

  def test_UniChemURI
    assert(Bio::UniChem::REST::UniChem_URI)
  end
  
  def test_Source
    assert(Bio::UniChem::Source)
  end

  def test_Sources
    assert(Bio::UniChem::Sources)
  end

end
