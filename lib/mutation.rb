require File.join(File.dirname(__FILE__),  'gene')


class Mutation
	attr_reader :reference_protein, :mutated_protein

	@@substituted_lookup = {'x' => 0, 'y' => 1, 'z' => 2}

	def initialize(reference_gene, mutated_protein_number, substituted_position, substituted_to)
		
		@reference_gene = reference_gene
		
		raise ArgumentError, "Mutated protein number outside of range" unless mutated_protein_number.between?(1, @reference_gene.protein.length)
		raise ArgumentError, "Subsituted position must be x, y or z" unless %w{x y z}.include?(substituted_position)
		raise ArgumentError, "Subsituted to base must be a, c, t or g" unless %w{a c t g}.include?(substituted_to)

		dna_index = (mutated_protein_number - 1) * 3
		
		@reference_protein = @reference_gene.coding_dna[dna_index,3]

		substituted_index = @@substituted_lookup[substituted_position]

		@mutated_protein  = @reference_protein.dup
		@mutated_protein[substituted_index] = substituted_to
	end

end
