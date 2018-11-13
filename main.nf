#! /usr/bin/env nextflow

params.in_files = 'home/bbulen/data/use_for_shiny.csv'

in_abs = Channel.fromPath(params.in_files)

process build_shiny_app {
	container 'rocker/tidyverse'
	publishDir 'data', mode: 'copy'

	input;
 	file i from in_abs
	
        script:
        """
        Rscript $baseDir/bin/shiny_app.R $i
        """
}

