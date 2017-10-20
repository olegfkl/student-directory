require 'csv'
@students = []
@width = 50
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts " -------------------------------------------"
  puts "|  1. Input the students"
  puts "|  2. Show the students"
  puts "|  3. Save the list of students"
  puts "|  4. Load the list of students"
  puts "|  5. Show students by specific letter"
  puts "|  6. Show students by length of characters"
  puts "|  7. Read source code of this program"
  puts "|  9. Exit"
  puts " -------------------------------------------"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "5"
      sort_by_letter
      print_footer
    when "6"
      sort_by_length(length=0)
      print_footer
    when "7"
      read_source_code
    when "9"
      exit
    else
      puts "|  I don't know what you mean, try again"
  end
end

def show_students
  print_header
  print_students
  print_footer
end

def input_students
  puts "|  Please enter your students' names along with other information about them"
  puts "|  To finish, just hit return twice"
  while true
  print "Student name:\n> "
  name = STDIN.gets.delete("\n")
  if name.empty?
      break
  end
  print "|  Type \"re\" to re-enter the name again.\n"
  print "|  Print student cohort:\n> "
    cohort = STDIN.gets.chomp
      if cohort.empty?
       cohort = "not specified".to_sym
     elsif cohort == "re".downcase
       redo
    end
    name.capitalize!
    cohort.capitalize!.to_sym
  append_to_students(name,cohort)
  if @students.count == 1
     puts "|  Now we have #{1} student"
  else
    puts "|  Now we have #{@students.count} students"
  end
    end
end

def append_to_students(name, cohort)
  @students << { name: name.capitalize, cohort: cohort, hobby: :tennis , age: 25,  place_of_birth: :UK}
end


# Using students.csv without Ruby CSV libary
=begin
def read_file_and_append(filename = "students.csv")
  if File.exists?(filename)
    File.open(filename , "r") do |file|
     file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
    append_to_students(name , cohort)
  end
end
    true
  else
    false
  end
end
=end

def read_file_and_append(filename = "students.csv")
  if File.exists?(filename)
    CSV.foreach(filename , "r") do |line|
      name, cohort = line
    append_to_students(name , cohort)
  end
    true
  else
    false
  end
end




def try_load_students
   filename = ARGV.first
   if filename.nil?
     puts read_file_and_append ? "Default database is loaded" : "Your database is empty, input students or load database"
   elsif read_file_and_append(filename)
        puts "|  Loaded #{@students.count} students from #{filename}"
   else # if it doesn't exist
       puts "|  Sorry, #{filename} doesn't exist."
       exit # quit the program
    end
end


def load_students(filename = "students.csv")
   print "|  Provide a file name to load a database from\n > "
   new_database = STDIN.gets.chomp
   if read_file_and_append(new_database)
      puts "|  Loaded!"
   else
      puts "|  Sorry, #{new_database} doesn't exist."
   end
end

# Without Ruby CSV libary
=begin
def save_students
  puts "|  Hit enter to save students to your default database  \"students.csv\""
  puts "|  -"
  puts "|  OR"
  puts "|  -"
 print "|  Provide database file name\n> "
 database = STDIN.gets.chomp
  database.empty? ? file = File.open("students.csv", "a+") : file = File.open(database, "a+")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "|  Saved!"
  file.close
end
=end

# Using Ruby CSV libary
def save_students
  puts "|  Hit enter to save students to your default database  \"students.csv\""
  puts "|  -"
  puts "|  OR"
  puts "|  -"
 print "|  Provide database file name\n> "
 database = STDIN.gets.chomp
  if database.empty?
    CSV.open("students.csv", "a+") do |csv|
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv << student_data
      end
    end
  else
    CSV.open(database, "a+") do |csv|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv << student_data
  end
end
end
  puts "|  Saved!"
end




def print_header
  puts "The students of Villains Academy".center(@width)
  puts "--------------".center(@width)
end

def print_students
     number = 0
     until number == @students.length
     puts "--  #{number + 1}   #{@students[number][:name]}".ljust(@width/5) + "  (#{@students[number][:cohort]} cohort, hobby: #{@students[number][:hobby]}, age: #{@students[number][:age]}, Place of birth: #{@students[number][:place_of_birth]})".ljust(@width/5)
     number +=1
   end
  end



def sort_by_letter
  specific_letter = []
   puts "|  Hit enter to show students in alphabetical order"
   puts "|  -"
   puts "|  OR"
   puts "|  -"
  print "|  Type the letter you would like to seach by\n> "
  letter = STDIN.gets.chomp
  if letter.empty?
     specific_letter =  @students.sort_by do | student |
     student[:name]
   end
  else
     @students.each do | student |
       if student[:name].downcase.start_with?(letter)
       specific_letter << { name: student[:name] , cohort: student[:cohort], hobby: :tennis , age: '25',  place_of_birth: :UK  }
       end
    end
  end
    if specific_letter.length == 1
      print "|   We found #{specific_letter.count} student "
    else
      print"|   We found #{specific_letter.count} students "
    end
      print "starting with letter \"#{letter}\"" if !letter.empty?
      puts ''
      specific_letter.each.with_index(1) do | student , index |
      puts "--  #{index}   #{student[:name]}".ljust(@width/5) + "  (#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust(@width/5)
    end
end

def sort_by_length(length)
  length_arr = []
   puts "|  Hit enter to show students by the length of the name"
   puts "|  -"
   puts "|  OR"
   puts "|  -"
  print "|  Type the number. It will show students whose length less than provided number\n> "
  length_num = STDIN.gets.chomp
  if length_num.empty?
     length_arr  =  @students.sort_by do | student |
     student[:name].length
     end
 else
      @students.each do | student |
      if student[:name].length < length_num.to_i
        length_arr << { name: student[:name] , cohort: student[:cohort], hobby: :tennis , age: '25',  place_of_birth: :UK  }
        end
      end
      if length_arr.length == 0
      puts "|   It seems you didn't enter any number of characters to search by"
    elsif length_arr.length == 1
      puts "|   We found #{length_arr.length} student with criteria less than #{length_num} characters"
      else
      puts "|   We found #{length_arr.length} students with criteria less than #{length_num} characters"
    end
  end
  length_arr.each.with_index(1) do | student , index |
  puts "--  #{index}   #{student[:name]}".ljust(@width/5) + "  (#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust(@width/5)
  end
end


def print_footer
  if @students.count == 0
    puts "Oops, no students to show".center(@width)
  elsif @students.count == 1
  puts "We have #{1} great student".center(@width)
 else
  puts "---------------------------------".center(@width)
  puts "Overall, we have #{@students.count} great students".center(@width)
  puts "---------------------------------".center(@width)
 end
end

def read_source_code
File.open((__FILE__), "r" ) do |file|
  file.readlines.each do |line|
    puts line
  end
end
end

try_load_students
interactive_menu

=begin
Improvements:
Improve input_students loop
Provide return to the menu when asked for database name for example in option 3 or 4
More user details
Sort by cohort
=end
