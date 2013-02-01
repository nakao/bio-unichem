module BioUniChem

  # UniChem REST Web service API Client.
  #
  #  # URI
  #  BioUniChem::REST::UniChem_URI
  #
  class REST

    HOST_NAME = "www.ebi.ac.uk"
    API_ROOT = "unichem/rest"
    BASE_URL = "http://" + HOST_NAME + "/" + API_ROOT

    # BioUniChem::REST::UniChem_URI
    module UniChem_URI

      def self.address(path)
        "#{BASE_URL}/#{path}"
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/src_compound_id/CHEMBL12/1
      # Example:  http://www.ebi.ac.uk/unichem/rest/src_compound_id/CHEMBL12/1/2
      def self.src_compound_id(src_compound_id, src_id, to_src_id = nil)
        path = [src_compound_id, src_id, to_src_id].compact.join("/")
        address("src_compound_id/#{path}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/src_compound_id_all/CHEMBL12/1
      # Example:  http://www.ebi.ac.uk/unichem/rest/src_compound_id_all/CHEMBL12/1/2
      def self.src_compound_id_all(src_compound_id, src_id, to_src_id = nil)
        path = [src_compound_id, src_id, to_src_id].compact.join("/")
        address("src_compound_id_all/#{path}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/mapping/4/1
      def self.mapping(src_id, to_src_id)
        address("mapping/#{src_id}/#{to_src_id}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/inchikey/AAOVKJBEBIDNHE-UHFFFAOYSA-N
      def self.inchikey(inchikey)
        address("inchikey/#{inchikey}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/inchikey_all/AAOVKJBEBIDNHE-UHFFFAOYSA-N
      def self.inchikey_all(inchikey)
        address("inchikey_all/#{inchikey}")
      end
 
      # Example:  http://www.ebi.ac.uk/unichem/rest/src_ids/
      def self.src_ids
        address("src_ids/")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/sources/1
      def self.sources(src_id)
        address("sources/#{src_id}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/structure/CHEMBL12/1
      def self.structure(src_compound_id, src_id)
        address("structure/#{src_compound_id}/#{src_id}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/structure_all/CHEMBL12/1
      def self.structure_all(src_compound_id, src_id)
        address("structure_all/#{src_compound_id}/#{src_id}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/src_compound_id_url/CHEMBL12/1/2
      def self.src_compound_id_url(src_compound_id, src_id, to_src_id)
        address("src_compound_id_url/#{src_compound_id}/#{src_id}/#{to_src_id}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/src_compound_id_all_obsolete/DB07699/2
      # Example:  http://www.ebi.ac.uk/unichem/rest/src_compound_id_all_obsolete/DB07699/2/1
      def self.src_compound_id_all_obsolete(src_compound_id, src_id, to_src_id = nil)
        path = [src_compound_id, src_id, to_src_id].compact.join("/")
        address("src_compound_id_all_obsolete/#{path}")
      end

      # Example:  http://www.ebi.ac.uk/unichem/rest/verbose_inchikey/HAUGRYOERYOXHX-UHFFFAOYSA-N
      def self.verbose_inchikey(inchikey)
        address("verbose_inchikey/#{inchikey}")
      end

      
    end
  end
end
