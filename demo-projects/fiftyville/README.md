[Fiftyville](https://cs50.harvard.edu/college/2020/fall/psets/7/fiftyville/#fiftyville)
=======================================================================================

Write SQL queries to solve a mystery.

## A Mistery in Fiftyville

The CS50 Duck has been stolen! The town of Fiftyville has called upon you to solve the mystery of the stolen duck. Authorities believe that the thief stole the duck and then, shortly afterwards, took a flight out of town with the help of an accomplice. Your goal is to identify:

-   Who the thief is,
-   What city the thief escaped to, and
-   Who the thief's accomplice is who helped them escape

All you know is that the theft took place on July 28, 2020 and that it took place on Chamberlin Street.

How will you go about solving this mystery? The Fiftyville authorities have taken some of the town's records from around the time of the theft and prepared a SQLite database for you, `fiftyville.db`, which contains tables of data from around the town. You can query that table using SQL `SELECT` queries to access the data of interest to you. Using just the information in the database, your task is to solve the mystery.

## Getting Started

Here's how to download this problem into your own CS50 IDE. Log into [CS50 IDE](https://ide.cs50.io/) and then, in a terminal window, execute each of the below.

-   Execute `cd` to ensure that you're in `~/` (i.e., your home directory, aka `~`).
-   If you haven't already, execute `mkdir pset7` to make (i.e., create) a directory called `pset7` in your home directory.
-   Execute `cd pset7` to change into (i.e., open) that directory.
-   Execute `wget https://cdn.cs50.net/2020/fall/psets/7/fiftyville/fiftyville.zip` to download a (compressed) ZIP file with this problem's distribution.
-   Execute `unzip fiftyville.zip` to uncompress that file.
-   Execute `rm fiftyville.zip` followed by `yes` or `y` to delete that ZIP file.
-   Execute `ls`. You should see a directory called `fiftyville`, which was inside of that ZIP file.
-   Execute `cd fiftyville` to change into that directory.
-   Execute `ls`. You should see a `fiftyville.db` file, a `log.sql` file, and an `answers.txt` file.

## Specification

For this problem, equally as important as solving the mystery itself is the process that you use to solve the mystery. In `log.sql`, keep a log of all SQL queries that you run on the database. Above each query, label each with a comment (in SQL, comments are any lines that begin with `--`) describing why you're running the query and/or what information you're hoping to get out of that particular query. You can use comments in the log file to add additional notes about your thought process as you solve the mystery: ultimately, this file should serve as evidence of the process you used to identify the thief!

Once you solve the mystery, complete each of the lines in `answers.txt` by filling in the name of the thief, the city that the thief escaped to, and the name of the thief's accomplice who helped them escape town. (Be sure not to change any of the existing text in the file or to add any other lines to the file!)

Ultimately, you should submit both your `log.sql` and `answers.txt` files.

## Walkthrough

[![Fiftyville Walkthrough](https://j.gifs.com/GRzwZy.gif)](https://www.youtube.com/watch?v=x7Q8tJMi7cQ)

## Testing

Execute the below to evaluate the correctness of your code using `check50`.

```
check50 cs50/problems/2020/fall/fiftyville
```

## How to Submit

You must submit both your `log.sql` file and your `answers.txt` file for this problem.

1.  Download your `log.sql` and your `answers.txt` files by control-clicking or right-clicking on the files in CS50 IDE's file browser and choosing Download.
2.  Go to CS50's [Gradescope page](https://www.gradescope.com/courses/157004).
3.  Click "Problem Set 7: Fiftyville".
4.  Drag and drop your `log.sql` and your `answers.txt` files to the area that says "Drag & Drop". Be sure that each file is correctly named!
5.  Click "Upload".

You should see a message that says "Problem Set 7: Fiftyville submitted successfully!" You won't see a score just yet, but if you see the message then we've received your submission!

## Acknowledgements

Inspired by another case over at [SQL City](http://mystery.knightlab.com/).
