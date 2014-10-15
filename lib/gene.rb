require 'rubygems'
require 'bundler/setup'
require 'bio'

class Gene
	attr_reader :full_dna, :coding_dna, :protein, :code_start_index

	def initialize(full_dna, coding_dna, protein)
		@full_dna = Bio::Sequence::NA.new(full_dna)
		@coding_dna = Bio::Sequence::NA.new(coding_dna)
		@protein = Bio::Sequence::AA.new(protein)
		
		@code_start_index = @full_dna.index(@coding_dna)
		raise ArgumentError, "Cannot find coding dna in full dna" unless @code_start_index
		raise ArgumentError, "Translated coding dna does not match protein" unless @coding_dna.translate.chop == @protein
	end

	def to_s
		puts "Full DNA:\n"
		puts @full_dna.scan(/.{1,80}/) 
		puts "\n"
		puts "Coding DNA:\n"
		puts @coding_dna.scan(/.{1,80}/)  
		puts "\n"
		puts "DNA translated to protein:\n"
		puts @coding_dna.translate.scan(/.{1,80}/) 
		puts "\n"
		puts "Protein:\n"
		puts @protein.scan(/.{1,80}/) 
		puts "\n"
		puts "Coding DNA starts at index: #{@code_start_index}\n"
		puts "\n"
	end
end
