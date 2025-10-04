rule generate_data:
	params:
		seed=config["generate_data"]["seed"]
	output:
		output="data/{sample}.csv"
	shell:
		"""
		Rscript workflow/scripts/generate_data.R \
		--sample {wildcards.sample} \
		--seed {params.seed} \
		--output {output.output}
		"""