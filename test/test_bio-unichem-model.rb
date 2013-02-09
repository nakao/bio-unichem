require 'helper'
require 'bio-unichem/model.rb'

class TestBioUniChemModelSource < Test::Unit::TestCase
  def setup
    record = {
      'src_id' => "1",
      "short_name" => "chembl",
      "description" => "A database of bioactive drug-like small molecules and associated bioactivities abstracted from the scientific literature",
      "full_name" => "ChEMBL",
      "process_of_data_acquisition" => "Standard InChIs and Keys provided on ftp site for each release.",
    }
    @obj = Bio::UniChem::Source.new(record)
  end


  def test_src_id
    assert_equal(@obj.src_id, "1")
  end  

  def test_short_name
    assert_equal(@obj.short_name, "chembl")
  end  
  
  def test_description
    assert_equal(@obj.description, "A database of bioactive drug-like small molecules and associated bioactivities abstracted from the scientific literature")
  end
  
  def test_full_name
    assert_equal(@obj.full_name, "ChEMBL")
  end
  
  def test_process_of_data_acquisition
    assert_equal(@obj.process_of_data_acquisition, "Standard InChIs and Keys provided on ftp site for each release.")
  end

end




class TestBioUniChemModelSources < Test::Unit::TestCase
  def setup
  	@o = Bio::UniChem::Sources.new
  end

  def test_new
  	assert_equal(@o.class, Bio::UniChem::Sources)
  end

  def test_find_by_src_id
    assert_equal(Bio::UniChem::Sources.find_by_src_id("1").class, Bio::UniChem::Source) 
  end

  def test_find_by_src_id_integer
    assert_equal(Bio::UniChem::Sources.find_by_src_id(1).class, Bio::UniChem::Source) 
  end

  
  def test_find_by_short_name
    assert_equal(Bio::UniChem::Sources.find_by_short_name("chembl").class, Bio::UniChem::Source) 
    assert_equal(Bio::UniChem::Sources.find_by_short_name("chembl").src_id, "1") 
  end

  def test_a_short_name
    assert_equal(Bio::UniChem::Sources["chembl"].class, Bio::UniChem::Source) 
    assert_equal(Bio::UniChem::Sources["chembl"].src_id, "1") 
  end

  def test_a_src_id_1
    assert_equal(Bio::UniChem::Sources["1"].class, Bio::UniChem::Source) 
    assert_equal(Bio::UniChem::Sources["1"].short_name, "chembl") 
  end

  def test_a_src_id_2
    assert_equal(Bio::UniChem::Sources["2"].class, Bio::UniChem::Source) 
    assert_equal(Bio::UniChem::Sources["2"].short_name, "drugbank") 
  end
  
end