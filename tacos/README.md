# Nextflow Taco-Making Tutorial 🌮🌮🌮

Welcome to the Nextflow Taco-Making Tutorial! This tutorial will guide you through creating a taco-making pipeline using Nextflow, where you can customize your taco with different proteins, tortillas, and toppings. You'll learn to use Nextflow to handle different stages of a pipeline and how to make your own taco recipes using parameterized processes.

- [Nextflow Taco-Making Tutorial 🌮🌮🌮](#nextflow-taco-making-tutorial-)
  - [Overview](#overview)
  - [What You'll Need](#what-youll-need)
  - [Running the Pipeline](#running-the-pipeline)
  - [Help Message](#help-message)
  - [Pipeline Details](#pipeline-details)
  - [Additional Customizations](#additional-customizations)
  - [End note!](#end-note)

## Overview

In this tutorial, we will:

1. **Prepare the tortilla** - Choose a tortilla type `flour` or `corn`.
2. **Cook the protein** - Choose a protein `steak`, `chicken`, `carnitas` or `sofritas`.
3. **Prepare the toppings** - Add your choice of toppings.
4. **Assemble the taco** - Combine the tortilla, protein, and toppings into a final taco.

Each step is a process in Nextflow, and we will learn how to pass data between these processes to assemble our taco.

## What You'll Need

- **Nextflow installed** on your computer. If you haven't installed Nextflow yet, you can follow the instructions link on the main README of this repository
- A basic understanding of terminal commands.

## Running the Pipeline

You can run the pipeline using the following command:
```
nextflow run taco_making.nf --protein carnitas --tortilla flour --toppings_list "lettuce, fajita veggies, salsa"
```

This will:

1. Prepare a **flour** tortilla.
2. Cook **carnitas**.
3. Prepare the toppings: **lettuce, fajita veggies, salsa**
4. Assemble the taco and save it to `assembled_taco.txt`.

## Help Message

To get more information about the parameters, run:
```
nextflow run taco_making.nf --help
```

This will display the following help message:
```
 ============================================================
        NBC Taco Making Nextflow Workflow - Command Line Help   
    ============================================================
    
    This Nextflow workflow simulates the process of making tacos.
    
    Usage:
      nextflow run taco_making.nf
      nextflow run taco_making.nf --help
    
    Parameters:
      --tortilla        Type of taco shell. Default: 'flour'. Options: 'flour', 'corn'.
      --protein         Type of meat for the taco. Default: 'carnitas'. Options: 'steak', 'chicken', 'carnitas', 'sofritas'.
      --toppings_list   List taco toppings. Default: 'lettuce, fajita veggies, tomato salsa'
      
    
    Workflow Steps:
      1. Prepare Taco Shell
      2. Cook Meat
      2. Prepare Toppings
      4. Assemble Taco
    
    Example:
      nextflow run taco_making.nf \
      --tortilla 'corn' \
      --protein 'carnitas' \
      --toppings_list 'lettuce, fajita veggies, tomato salsa'
```

## Pipeline Details

The pipeline consists of several steps:

1. `prepareTortilla`: This process prepares the tortilla based on your selection. It will create a file `tortilla.txt` with the type of tortilla chosen.
2. `cookProtein`: This process cooks the selected protein and writes the cooking steps to `cooked_protein.txt`.
3. `prepareToppings`: This process handles the toppings, writing the list of selected toppings to `toppings.txt`.
4. `assembleTaco`: This final process assembles the taco by combining the tortilla, protein, and toppings into one file, `assembled_taco.txt`.

## Additional Customizations

You can modify the pipeline to suit your needs by:

- Adding more toppings or making a TXT/CSV file.
- Changing the protein or tortilla options.
- Altering the process to include more customizations or additional steps.

## End note!

Congratulations! You've successfully created your own taco-making pipeline using Nextflow. Now you can experiment with different combinations of ingredients and processes to create your own taco recipes in Nextflow!

**Happy Taco-Making!** 🌮🎉

**Happy Nextflow-ing!** 🚀🎉