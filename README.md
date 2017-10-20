# Student Directory #

The student directory script allows you to manage the list of students enrolled at Villains Academy.

## Objectives of building a directory

Getting a basic understanding of the Ruby programming language.

## How to use ##

Using Command Line:

```shell

git clone https://github.com/olegfkl/student-directory.git
```
Navigate to student-directory

```shell

cd student-directory
```
Run the program

```shell

ruby directory.rb database.csv
```
Providing a .csv database file is optional

## Exercises ##

While building students directory the following tasks were completed


1.  We're using the each() method to iterate over an array of students. How can you modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"?

2.  Modify your program to only print the students whose name begins with a specific letter.

3.  Modify your program to only print the students whose name is shorter than 12 characters.

4.  Rewrite the each() method that prints all students using while or until control flow methods.

5.  Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.

6.  Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.

7.  In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?

8.  Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise?

9. We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).

10. Once you have completed the "Asking for user input" section, open [this file](https://raw.githubusercontent.com/anitacanita/student-directory/master/typos.rb). It's Ruby code but it has some typos. Copy it to a local file and open it in Atom without syntax highlighting. To do this, select "Plain Text" in the lower right corner of the window. Now, find all typos in that file and correct them. Use your experience, online documentation, etc. to find all mistakes. Run the script in the terminal from time to time to make sure it works as it should. Google the errors Ruby will give you, think about what they could mean, try different things but don't look the answer up.

11. What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement to only print the list if there is at least one student in there?

12.  After we added the code to load the students from file, we ended up with adding the students to @students in two places. The lines in load_ students() and  input_students() are almost the same. This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem?

13.  How could you make the program load students.csv by default if no file is given on startup? Which methods would you need to change?

14.  Right now, when the user choses an option from our menu, there's no way of them knowing if the action was successful. Can you fix this and implement feedback messages for the user?

15.  The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make the script more flexible by asking for the filename if the user chooses these menu items.

16.  We are opening and closing the files manually. Read the documentation of the File class to find out how to use a code block (do...end) to access a file, so that we didn't have to close it explicitly (it will be closed automatically when the block finishes). Refactor the code to use a code block.

17.  We are de-facto using CSV format to store data. However, Ruby includes [a library to work with the CSV files](http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html) that we could use instead of working directly with the files. Refactor the code to use this library.

18.  Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.
