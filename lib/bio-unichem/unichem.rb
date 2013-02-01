require 'bio'
require 'open-uri'
require 'json'

module BioUniChem

  # UniChem REST Web service API Client.
  #
  #  # URI
  #  BioUniChem::REST::UniChem_URI
  #
  class REST

    HOST_NAME = "www.ebi.ac.uk"
    API_ROOT = "unichem/rest"
    BASE_URL = "https://" + HOST_NAME + "/" + API_ROOT

    # Generate URIs for UniChem REST Web service
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
    
    # BioUniChem::REST.new
    def initialize
      @header = {
        'User-Agent' => "BioUniChem, BioRuby/#{Bio::BIORUBY_VERSION_ID}"
      }
      @debug = false
      @status = ""
    end
    
    #
    def get(uri)
      res = open(uri, @header)
      @status = res.status
      return JSON(res.read)
    end
    private :get
    
    #
    def src_compound_id(src_compound_id, src_id, to_src_id = nil)
      get(BioUniChem::REST::UniChem_URI.src_compound_id(src_compound_id, src_id, to_src_id))
    end
    
    def src_compound_id_all(src_compound_id, src_id, to_src_id = nil)
      get(BioUniChem::REST::UniChem_URI.src_compound_id_all(src_compound_id, src_id, to_src_id))
    end
    
    def mapping(src_id, to_src_id)
      get(BioUniChem::REST::UniChem_URI.mapping(src_id, to_src_id))
    end

    def inchikey(inchikey)
      get(BioUniChem::REST::UniChem_URI.inchikey(inchikey))
    end

    def inchikey_all(inchikey)
      get(BioUniChem::REST::UniChem_URI. inchikey_all(inchikey))
    end

    def src_ids
      get(BioUniChem::REST::UniChem_URI.src_ids)
    end

    def sources(src_id)
      get(BioUniChem::REST::UniChem_URI.sources(src_id))
    end

    def structure(src_compound_id, src_id)
      get(BioUniChem::REST::UniChem_URI.structure(src_compound_id, src_id))
    end

    def structure_all(src_compound_id, src_id)
      get(BioUniChem::REST::UniChem_URI.structure_all(src_compound_id, src_id))
    end

    def src_compound_id_url(src_compound_id, src_id, to_src_id)
      get(BioUniChem::REST::UniChem_URI.src_compound_id_url(src_compound_id, src_id, to_src_id))
    end

    def src_compound_id_all_obsolete(src_compound_id, src_id, to_src_id = nil)
      get(BioUniChem::REST::UniChem_URI.src_compound_id_all_obsolete(src_compound_id, src_id, to_src_id = nil))
    end

    def verbose_inchikey(inchikey)
      get(BioUniChem::REST::UniChem_URI.verbose_inchikey(inchikey))
    end

    
  end
end
