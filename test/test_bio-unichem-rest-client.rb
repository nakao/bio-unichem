require 'helper'
require 'bio-unichem/unichem.rb'

class TestBioUniChemRESTClient < Test::Unit::TestCase
  def setup
    @obj = Bio::UniChem::REST.new
  end
  
  def test_src_compound_id_2
    res = @obj.src_compound_id("CHEMBL12", "1") 
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
  end

  def test_src_compound_id_2_src_id
    res = @obj.src_compound_id("CHEMBL12", "1") 
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
  end

  def test_src_compound_id_3
    res = @obj.src_compound_id("CHEMBL12", "1", "2") 
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
    assert_equal(res.first["src_compound_id"], "DB00829")
  end

  def test_src_compound_id_3_src_id
    res = @obj.src_compound_id("CHEMBL12", "1", "2") 
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
    assert_equal(res.first["src_compound_id"], "DB00829")
  end

  def test_src_compound_id_all_2
    res = @obj.src_compound_id_all("CHEMBL12", "1")
    t = res.find {|x| x['src_id'] == "1" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["assignment"], "1")
    assert_equal(t["src_id"], "1")
    assert_equal(t["src_compound_id"], "CHEMBL12")
  end

  def test_src_compound_id_all_3
    res = @obj.src_compound_id_all("CHEMBL12", "1", "2")
    t = res.find {|x| x['src_compound_id'] == "DB00829" }    
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["assignment"], "1")
    assert_equal(t["src_compound_id"], "DB00829")
  end

  def test_mapping
    res = @obj.mapping("4", "1")
    t = res.find {|x| x['1'] == "CHEMBL247132" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["1"], "CHEMBL247132")
    assert_equal(t["4"], "1592")
  end

  def test_mapping_src_id
    res = @obj.mapping("4", "1")
    t = res.find {|x| x['1'] == "CHEMBL247132" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["1"], "CHEMBL247132")
    assert_equal(t["4"], "1592")
  end
  
  def test_inchikey
    res = @obj.inchikey("AAOVKJBEBIDNHE-UHFFFAOYSA-N")
    t = res.find {|x| x['src_id'] == "1" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["src_id"], "1")
    assert_equal(t["src_compound_id"], "CHEMBL12")
  end
  
  def test_inchikey_all
    res = @obj.inchikey_all("AAOVKJBEBIDNHE-UHFFFAOYSA-N")
    t = res.find {|x| x['src_id'] == "1" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["assignment"], "1")
    assert_equal(t["src_id"], "1")
    assert_equal(t["src_compound_id"], "CHEMBL12")
  end
  
  def test_src_ids
    res = @obj.src_ids
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
    assert_equal(res.first["src_id"], "1")
  end
  
  def test_sources
    res = @obj.sources("1")
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
    assert_equal(res.first["src_id"], "1")
  end
  
  def test_structure
    res = @obj.structure("CHEMBL12", "1")
    t = res.find {|x| x['standardinchikey'] == "AAOVKJBEBIDNHE-UHFFFAOYSA-N" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["standardinchikey"], "AAOVKJBEBIDNHE-UHFFFAOYSA-N")
    assert_equal(t["standardinchi"], 
      "InChI=1S/C16H13ClN2O/c1-19-14-8-7-12(17)9-13(14)16(18-10-15(19)20)11-5-3-2-4-6-11/h2-9H,10H2,1H3")
  end
  
  def test_structure_all
    res = @obj.structure_all("CHEMBL12", "1")
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
    assert_equal(res.first["assignment"], "1")
    assert_equal(res.first["standardinchikey"], "AAOVKJBEBIDNHE-UHFFFAOYSA-N")
    assert_equal(res.first["standardinchi"], 
      "InChI=1S/C16H13ClN2O/c1-19-14-8-7-12(17)9-13(14)16(18-10-15(19)20)11-5-3-2-4-6-11/h2-9H,10H2,1H3")
  end
  
  def test_src_compound_id_url
    res = @obj.src_compound_id_url("CHEMBL12", "1", "2")
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
    assert_equal(res.first["url"], "http://www.drugbank.ca/drugs/DB00829")
  end
  
  def test_src_compound_id_all_obsolete_2
    res = @obj.src_compound_id_all_obsolete("DB07699", "2")
    t = res.find {|x| x['src_id'] == "1" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["assignment"], "1")
    assert_equal(t["src_id"], "1")
    assert_equal(t["UCI"], "304698")
    assert_equal(t["src_compound_id"], "CHEMBL12")
  end
  
  def test_src_compound_id_all_obsolete_3
    res = @obj.src_compound_id_all_obsolete("DB07699", "2", "1")
    t = res.find {|x| x['src_id'] == "1" }
    assert_equal(res.class, Array)
    assert_equal(t.class, Hash)
    assert_equal(t["assignment"], "1")
    assert_equal(t["src_id"], "1")
    assert_equal(t["UCI"], "304698")
    assert_equal(t["src_compound_id"], "CHEMBL12")
  end
  
  def test_verbose_inchikey
    res = @obj.verbose_inchikey("HAUGRYOERYOXHX-UHFFFAOYSA-N")
    t = res.find {|x| x['name'] == "chembl" }
    assert_equal(res.class, Array)
    assert_equal(res.first.class, Hash)
    assert_equal(res.first["name"], "chembl")
    assert_equal(res.first["description"], "A database of bioactive drug-like small molecules and associated bioactivities abstracted from the scientific literature")
    assert_equal(res.first["name_long"], "ChEMBL")
    assert_equal(res.first["src_compound_id"], ["CHEMBL68500"])
    assert_equal(res.first["base_id_url"], "https://www.ebi.ac.uk/chembldb/compound/inspect/")
    assert_equal(res.first["src_id"], "1")
    assert_equal(res.first["base_id_url_available"], "1")
    assert_equal(res.first["src_url"], "https://www.ebi.ac.uk/chembl/")
  end
  
end
