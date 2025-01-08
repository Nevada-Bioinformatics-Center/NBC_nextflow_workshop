#!/usr/bin/env nextflow

// Enable DSL 2 syntax
nextflow.enable.dsl = 2

// Introduction to the tutorial

/*
 * Welcome to the Nextflow Taco-Making Tutorial!
 * In this tutorial, you will learn how to create a taco-making pipeline using using Nextflow
 * You will be able to choose the protein, tortilla, and toppings for your tacos
 */

// Define parameters with default values
params.tortilla = 'flour' // Fill in the tortilla type ('flour' or corn)


// Step 1: Preparing the Tortilla
process prepareTortilla {

    publishDir './results', mode: 'copy'

    input:
        val tortilla_type
    
    output:
        path ( 'tortilla.txt' )
    
    script:
    """
    echo "Preparing ${tortilla_type} tortilla .. " > tortilla.txt
    """
}


// Workflow to run the tortilla preparation process
workflow {

    prepareTortilla(params.tortilla)// Execute process
}