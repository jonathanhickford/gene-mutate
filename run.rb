require 'highline/import'
require 'bio'
require File.join(File.dirname(__FILE__), 'lib' ,'mutation')

if ARGV.length < 1
  puts 'Usage: run.rb FASTA_FILE'
  puts 'Fasta formatted file must contain at least the cDNA transcripts, Coding sequences (CDS) and Ammino acid sequences'
  exit 0
end


full_dna, dna, protein = String.new

file = Bio::FastaFormat.open(ARGV.shift)

file.each do |entry|
	puts entry.definition
	if entry.definition =~ /cds:KNOWN_protein_coding/
		dna = entry.data
	elsif entry.definition =~ /pep:KNOWN_protein_coding/
		protein = entry.data
	elsif entry.definition =~ /cdna:KNOWN_protein_coding/
		full_dna = entry.data
	end
end

tp53 = Gene.new(full_dna, dna, protein)

#puts tp53.to_s


protein_number = ask("Protein Number?  ", Integer) { |q| q.in = 1..tp53.protein.length }
substituted_position = ask("Which base has been substituted within the protein (xyz)?  ", String) { |q| q.validate = lambda { |q| %w{x y z}.include?(q)} }
substituted_to = ask("Which base has it been substituted to (actg)?  ", String) { |q| q.validate = lambda { |q| %w{a c t g}.include?(q)} }
puts "\n"

mutation = Mutation.new(tp53, protein_number, substituted_position, substituted_to)

puts "Reference protein: #{mutation.reference_protein.translate}\n"
puts "Reference protein names: #{mutation.reference_protein.translate.names}\n"
puts "Regerence protein codes: #{mutation.reference_protein.translate.codes}\n"
puts "Reference codon: #{mutation.reference_protein}\n"
puts "\n"

puts "Mutated protein: #{mutation.mutated_protein.translate}\n"
puts "Mutated protein names: #{mutation.mutated_protein.translate.names}\n"
puts "Mutated protein codes: #{mutation.mutated_protein.translate.codes}\n"
puts "Mutated codon: #{mutation.mutated_protein}\n"
puts "\n"




