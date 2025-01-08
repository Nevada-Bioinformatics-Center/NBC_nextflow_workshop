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
params.protein = 'carnitas' // Fill in the choice of protein ('steak', 'chicken', 'carnitas' or 'sofritas')
params.toppings = 'lettuce, fajita veggies, tomato salsa'


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


// Step 2: Cooking the choice of protein
process cookProtein {

    publishDir './results', mode: 'copy'

    input:
        val protein_type

    output:
        path ( 'cooked_protein.txt' )

    script:
    """
    echo "Cooking ${protein_type} .. " > cooked_protein.txt
    """
}


// Step 3: Preparing the toppings
process prepareToppings {

    publishDir './results', mode: 'copy'

    input:
        val toppings_list

    output:
        path ( 'toppings.txt' )
    
    script:
    """
    echo "Preparing toppings: ${toppings_list} .. " > toppings.txt
    """
}


// Workflow to run the tortilla preparation process
workflow {

    // Execute process
    prepareTortilla(params.tortilla)
    cookProtein(params.protein)

    Channel.of(params.toppings).collect().set{ toppings_list_ch } // Define pipeline channel
    prepareToppings(toppings_list_ch)
}