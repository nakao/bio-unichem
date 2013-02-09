require 'helper'
require 'bio-unichem/unichem.rb'

class TestBioUniChemURI < Test::Unit::TestCase
  def setup
    @obj = Bio::UniChem::REST::UniChem_URI
  end
  
  def test_src_compound_id_2
    assert_equal(
      @obj.src_compound_id("CHEMBL12", "1"), 
      "https://www.ebi.ac.uk/unichem/rest/src_compound_id/CHEMBL12/1")
  end

  def test_src_compound_id_3
    assert_equal(
      @obj.src_compound_id("CHEMBL12", "1", "2"), 
      "https://www.ebi.ac.uk/unichem/rest/src_compound_id/CHEMBL12/1/2")
  end

  def test_src_compound_id_all_2
    assert_equal(
      @obj.src_compound_id_all("CHEMBL12", "1"),
      "https://www.ebi.ac.uk/unichem/rest/src_compound_id_all/CHEMBL12/1")
  end

  def test_src_compound_id_all_3
    assert_equal(
      @obj.src_compound_id_all("CHEMBL12", "1", "2"), 
      "https://www.ebi.ac.uk/unichem/rest/src_compound_id_all/CHEMBL12/1/2")
  end

  def test_mapping
    assert_equal(
      @obj.mapping("4", "1"), 
      "https://www.ebi.ac.uk/unichem/rest/mapping/4/1")
  end
  
  def test_inchikey
    assert_equal(
      @obj.inchikey("AAOVKJBEBIDNHE-UHFFFAOYSA-N"),
      "https://www.ebi.ac.uk/unichem/rest/inchikey/AAOVKJBEBIDNHE-UHFFFAOYSA-N")
  end
  
  def test_inchikey_all
    assert_equal(
      @obj.inchikey_all("AAOVKJBEBIDNHE-UHFFFAOYSA-N"),
      "https://www.ebi.ac.uk/unichem/rest/inchikey_all/AAOVKJBEBIDNHE-UHFFFAOYSA-N")
  end
  
  def test_src_ids
    assert_equal(
      @obj.src_ids,
      "https://www.ebi.ac.uk/unichem/rest/src_ids/")      
  end
  
  def test_sources
    assert_equal(
      @obj.sources("1"),
      "https://www.ebi.ac.uk/unichem/rest/sources/1")      
  end
  
  def test_structure
    assert_equal(
      @obj.structure("CHEMBL12", "1"),
      "https://www.ebi.ac.uk/unichem/rest/structure/CHEMBL12/1")    
  end
  
  def test_structure_all
    assert_equal(
      @obj.structure_all("CHEMBL12", "1"),
      "https://www.ebi.ac.uk/unichem/rest/structure_all/CHEMBL12/1")      
  end
  
  def test_src_compound_id_url
    assert_equal(
      @obj.src_compound_id_url("CHEMBL12", "1", "2"),
      "https://www.ebi.ac.uk/unichem/rest/src_compound_id_url/CHEMBL12/1/2")      
  end
  
  def test_src_compound_id_all_obsolete_2
    assert_equal(
      @obj.src_compound_id_all_obsolete("DB07699", "2"),
      "https://www.ebi.ac.uk/unichem/rest/src_compound_id_all_obsolete/DB07699/2")
  end
  
  def test_src_compound_id_all_obsolete_3
    assert_equal(
      @obj.src_compound_id_all_obsolete("DB07699", "2", "1"),
      "https://www.ebi.ac.uk/unichem/rest/src_compound_id_all_obsolete/DB07699/2/1")      
  end
  
  def test_verbose_inchikey
    assert_equal(
      @obj.verbose_inchikey("HAUGRYOERYOXHX-UHFFFAOYSA-N"),
      "https://www.ebi.ac.uk/unichem/rest/verbose_inchikey/HAUGRYOERYOXHX-UHFFFAOYSA-N")      
  end
  
end
