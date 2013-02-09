module Bio
  class UniChem
    
    # Bio::UniChem::Source
    #
    # hash = {'src_id' => '1, 'short_name' => ... }
    # chembl = Bio::UniChem::Source.new(hash)
    # chembl.src_id
    # #=> "1"
    # chembl.short_name
    # #=> "chembl"
    # chembl.full_name
    # #=> "ChEMBL"
    #
    class Source      
      attr_reader :src_id
      attr_reader :short_name
      attr_reader :full_name
      attr_reader :description
      attr_reader :process_of_data_acquisition
      
      
      # Bio::UniChem::Source.new(hash)
      def initialize(hash = nil)
        @src_id      = hash["src_id"]
        @short_name  = hash["short_name"]
        @full_name   = hash["full_name"]
        @description = hash["description"]
        @process_of_data_acquisition = hash["process_of_data_acquisition"]
      end
      
    end
    
    # Bio::UniChem::Sources
    #
    # Usage
    #  aSource = Bio::UniChem::Sources["chembl"]
    #  aSource = Bio::UniChem::Sources["1"]
    #  aSource.src_id     
    #  #=> "1"
    #  aSource.short_name 
    #  #=> "chembl"
    #  aSource.full_name  
    #  #=> "ChEMBL"
    #        
    class Sources
      
      # 2013-02-09
      # src_id  
      # Short name  
      # Full name 
      # Description 
      # Process of Data Acquisition
      data = %q|
        1
        chembl
        ChEMBL
        A database of bioactive drug-like small molecules and associated bioactivities abstracted from the scientific literature
        Standard InChIs and Keys provided on ftp site for each release.
        //
        2
        drugbank
        DrugBank
        A database that combines drug (i.e. chemical, pharmacological and pharmaceutical) data with drug target (i.e. sequence, structure, and pathway) information.
        Standard InChIs and Keys provided within sd file on ftp site for each release.
        //
        3
        pdb
        PDBe (Protein Data Bank Europe)
        The European resource for the collection, organisation and dissemination of data on biological macromolecular structures, including structures of small molecule ligands for proteins.
        Standard InChIs and Keys provided by direct querying of Oracle DB.
        //
        4
        iuphar
        International Union of Basic and Clinical Pharmacology  A resource for representing the interests of pharmacologists around the world. DB contains structures of small molecule ligands of pharmacological significance.
        Standard InChIs and Keys provided by email on request.
        //
        5
        pubchem_dotf
        PubChem ('Drugs of the Future' subset)  A subset of the PubChem DB: from the original depositor 'drugs of the future' (Prous).
        Mol files for SIDs downloaded manually, via PubChem interface, and Standard InChIs and Keys generated by InChI software. SIDs used as identifiers.
        //
        6
        kegg_ligand
        KEGG (Kyoto Encyclopedia of Genes and Genomes) Ligand
        KEGG LIGAND is a composite DB consisting of COMPOUND, GLYCAN, REACTION, RPAIR, RCLASS, and ENZYME DBs, whose entries are identified by C, G, R, RP, RC, and EC numbers, respectively.
        Mol files were downloaded manually prior to this download becoming private. Standard InChIs and Keys generated by InChI software.
        //
        7
        chebi
        ChEBI (Chemical Entities of Biological Interest).
        ChEBI is a freely available dictionary of molecular entities focused on 'small' chemical compounds
        Std InChis (but no keys) provided on ftp site. Keys generated by UniChem. Only 'three star' compounds downloaded
        //
        8
        nih_ncc
        NIH Clinical Collection
        Collections of plated arrays of small molecules that have a history of use in human clinical trials. Assembled by the National Institutes of Health (NIH) through the Molecular Libraries Roadmap Initiative
        Mol files downloaded manually and Standard InChIs and Keys generated by InChI software
        //
        9
        zinc
        ZINC
        A free database of commercially-available compounds for virtual screening, provided by the Shoichet Laboratory in the Department of Pharmaceutical Chemistry at the University of California, San Francisco (UCSF). [Irwin and Shoichet, J. Chem. Inf. Model. 2005;45(1):177-82]
        SD file ('Standard', 'All Purchasable' of ~17.8 million) downloaded from source and InChis generated by UniChem
        //
        10
        emolecules
        eMolecules
        A free chemical structure search engine containing millions of public domain structures. Pricing, availabilities, and vendor information requires an eMolecules Plus subscription.
        Downloaded as an SD file from source, Converted to InChI and INChIKeys by UniChem
        //
        11
        ibm
        IBM strategic IP insight platform and the National Institutes of Health
        A massive, searchable database of chemical and pharmaceutical data, extracted from millions of patents and scientific literature. Identifiers in UniChem are IBM compound identifiers.
        SMILES download available. Converted to InChi by PPP in house.
        //
        12
        atlas
        Gene Expression Atlas
        The Gene Expression Atlas is a semantically enriched database of meta-analysis based summary statistics over a curated subset of ArrayExpress Archive, servicing queries for condition-specific gene expression patterns as well as broader exploratory searches for biologically interesting genes/samples.
        Currently extracted from compound names.
        //
        13
        patents
        IBM strategic IP insight platform and the National Institutes of Health.
        Data, provided by IBM-NIH, was originally extracted from patents from three publishing bodies (US, EPO and WIPO) with publication dates through (including) 2000-12-31. For UniChem, these data were parsed to include only whole molecules present in either the title or claims fields. Further filters included removal of: 1. All molecules mapping to > 10,000 patents, 2. Non-organic molecules, 3. Small molecules (mw <90, number of atoms < 7). In addition, for structures mapping to >100 patents, only 100 randomly selected patents were selected. Identifiers in UniChem are patent number identifiers
        SMILES download available. Converted to InChi in house. Patent Ids used for Ids instead of cpd_ids. Data set filtered to remove compounds not appearing in the title or claims sections of the patent, and to remove very frequently occurring compounds
    |
      delimiter = "/\/\//"
      Data = data.strip.split(delimiter).map do |record|
        t = record.strip.split("\n").map {|line| line.strip }
        Bio::UniChem::Source.new({"src_id" => t[0],  
                              "short_name" => t[1],  
                               "full_name" => t[2], 
                             "description" => t[3], 
             "process_of_data_acquisition" => t[4]})
      end
      
      # Bio::UniChem::Sources.find_by_src_id(src_id) #=> aSource
      def self.find_by_src_id(src_id)
        Data.find {|x| x.src_id == src_id.to_s }
      end
      
      # Bio::UniChem::Sources.find_by_short_name(short_name) #=> aSource
      def self.find_by_short_name(short_name)
        Data.find {|x| x.short_name == short_name }
      end
      
      # Bio::UniChem::Sources[arg] #=> aSource
      # arg : src_id, short_name 
      def self.[](arg)
        case arg
        when /^\d$/
          self.find_by_src_id(arg)
        else
          self.find_by_short_name(arg)
        end
      end
    end

  end
  
end