#!/usr/bin/env nextflow

// Enable DSL 2 syntax
nextflow.enable.dsl = 2

// Introduction to the tutorial

/*
 * Welcome to the Nextflow Taco-Making Tutorial!
 * In this tutorial, you will learn how to create a taco-making pipeline using using Nextflow
 * You will be able to choose the protein, tortilla, and toppings for your tacos
 */

// Step 1: Preparing the Tortilla
process prepareTortilla {

    label 'preparing_tortilla'

    input:
        val tortilla_type
    
    output:
        path ( 'tortilla.txt' ), emit: prep_tortilla
    
    script:
    """
    ping -t 30 google.com > /dev/null
    echo "Preparing ${tortilla_type} tortilla .. " > tortilla.txt
    """
}


// Step 2: Cooking the choice of protein
process cookProtein {

    label 'cooking_protein'

    input:
        val protein_type

    output:
        path ( 'cooked_protein.txt' ), emit: cooked_protein

    script:
    """
    ping -t 30 google.com > /dev/null
    echo "Cooking ${protein_type} .. " > cooked_protein.txt
    """
}


// Step 3: Preparing the toppings
process prepareToppings {

    label 'preparing_toppings'

    input:
        val toppings_list

    output:
        path ( 'toppings.txt' ), emit: prep_toppings
    
    script:
    """
    ping -t 30 google.com > /dev/null
    echo "Preparing toppings: ${toppings_list} .. " > toppings.txt
    """
}


// Step 4: Assembling our Taco
process assembleTaco {

    label 'assembling_tacos'

    input:
        val prep_tortilla
        val cooked_protein
        val prep_toppings
    
    output:
        path ( 'assembled_taco.txt' )
    
    script:
    """
    ping -t 30 google.com > /dev/null

    # Create the assembled taco output file with the introductory line
    echo "Assembling taco with the following ingredients:" > assembled_taco.txt

    # Extract the content from tortilla.txt, cooked_protein.txt, and toppings.txt
    tortilla_content=\$(cat ${prep_tortilla})
    protein_content=\$(cat ${cooked_protein})
    toppings_content=\$(cat ${prep_toppings})

    # Add the content of the ingredients to the assembled taco file with proper formatting
    echo -e "Tortilla: \${tortilla_content}\nProtein: \${protein_content}\nToppings: \${toppings_content}" >> assembled_taco.txt
    """
}

// The workflow defines the sequence of processes to be executed. We first prepare the protein,
// tortilla, and toppings, and then assemble the taco.
workflow  {

    // Validate required parameters
    if (params.protein != "steak" && params.protein != "chicken" && params.protein != "carnitas" && params.protein != "sofritas" ) {
        exit 1, "Please select your choice of proteins. We have: steak, chicken, carnitas and sofritas"
    }

    if (params.tortilla != "flour" && params.tortilla != "corn") {
        exit 1, "Please select your choice of tortilla. We have: flour and corn"
    }

    // Help message validation
    if (params.help) {
            log.info params.help_message
        exit 0
    }


    // Define toppings channels
    Channel.of(params.toppings_list).collect().set{ toppings_ch }


    println ( "Welcome to the Nextflow Taco-Making Tutorial!" )
    println ( "In this tutorial, you will learn how to create a taco-making pipeline using Nextflow." )
    println ( "You will be able to choose the protein, tortilla, and toppings for your taco." )
    
    println ( "We will start by customizing your taco with the following defaults:" )
    println ( "- Protein: ${params.protein}" )
    println ( "- Tortilla: ${params.tortilla}" )
    println ( "- Toppings: ${params.toppings_list}" )

    // --------------------
    //   Pipeline Steps
    // --------------------

    // Start the taco-making process by calling the individual steps
    prepareTortilla( params.tortilla )   // Prepare the tortilla
    cookProtein( params.protein )    // Prepare the protein
    prepareToppings( toppings_ch )  // Prepare the toppings

    // Assemble everything into a taco
    assembleTaco(
        prepareTortilla.out,
        cookProtein.out,
        prepareToppings.out
    )

    // Tutorial Completion Message
    println ( "Taco-making tutorial completed!" )
    println ( "The taco has been assembled and saved to 'assembled_taco.txt'." )
    println ( "Feel free to modify the parameters to make your own customized taco!" )

    workflow.onComplete = {
        // Any workflow property can be used here
    println "Pipeline completed at: $workflow.complete"
    println "Execution status: ${workflow.success ? 'OK' : 'failed' }"
    println "Command line: $workflow.commandLine"
    }

    workflow.onError = {
    println "Error: Pipeline execution stopped with the following message: ${workflow.errorMessage}"
    }
}