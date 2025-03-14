#!/usr/bin/env nextflow

// Enable DSL 2 syntax
nextflow.enable.dsl = 2

/*
 * A Simple Nextflow script to print 'Hello, welcome to the NBC Nextflow Workshop!'
 */

// In this section we will define a process called 'greetings' that will print to standard out

// Type in the process name 'greetings'
 process greetings {
    
    output:
        stdout

    // The script section that prints the statement
    script:
    """
    echo "Hello, welcome to the NBC Nextflow Workshop!"
    """
 }


// In this section, create workflow which calls the 'greetings' process
workflow  {
    greetings()
}