rule generate_data:
	params:
		seed=config["generate_data"]["seed"]
	output:
		output="data/{sample}.csv"
	shell:
		"""
		Rscript workflow/scripts/generate_data.R \
		--sample_metadata {wildcards.sample} \
		--seed {params.seed} \
		--output {output.output}
		"""