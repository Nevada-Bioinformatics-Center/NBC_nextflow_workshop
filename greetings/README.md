# Creating a Simple Greeting Workflow

Welcome! Here, you'll learn how to create a basic Nextflow workflow. By the end of this tutorial, you'll be able to define a simple process in Nextflow and execute a workflow that prints a greeting message to the console/terminal.

In this tutorial, we will:

1. Understand the structure of a basic Nextflow script.
2. Create a simple process to print a message.
3. Define a workflow to run that process.
4. Execute the script to see the results.

## What You'll Need

- **Nextflow installed** on your computer. If you haven't installed Nextflow yet, you can follow the instructions link on the main README of this repository
- A basic understanding of terminal commands.

## Step 1: Setting Up Your Nextflow Script

In this step, we'll create a simple script that prints a welcoming message. We want to print, the following message with some bash code.
```
echo "Hello, welcome to the NBC Nextflow Workshop!"
```

### Create the Script

1. Open your favorite text editor and open the `greetings.nf` file. Note: Already a basic syntax has been created for you to start.
2. Now, copy the following code into your file.

```
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
```

## Step 2: Running the Script

Now that we've created the script, let's execute it to see the greeting message in action.

### Run the Script

1. Open your terminal
2. Navigate to the directory where your `greetings.nf` script is saved.
3. Execute the script using Nextflow:
   ```
   nextflow run greetings.nf
   ```

### Expected Output

Once the script runs, you should see the following output in your terminal:
```
Hello, welcome to the NBC Nextflow Workshop!
```

Congratulations! You've just run your first Nextflow script.