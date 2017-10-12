$students = []
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Show students by specific letter"
  puts "4. Show students by length of characters"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      sort_by_letter('a')
      print_footer
    when "4"
      sort_by_length(5)
      print_footer
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

$width = 50
def input_students
  puts "Please enter your students' names along with other information about them"
  puts "To finish, just hit return twice"
  while true
  print "Student name:\n"
  name = gets.delete("\n")
  if name.empty?
      break
  end
  print "Type \"re\" to re-enter the name again.\n"
  print "Select student cohort:\n"
    cohort = gets.chomp
      if cohort.empty?
       cohort = "not specified".to_sym
     elsif cohort == "re"
       redo
    end
  $students << { name: name.capitalize , cohort: cohort.capitalize.to_sym , hobby: :tennis , age: 25,  place_of_birth: :UK}
  if $students.count == 1
  puts " Now we have #{1} student"
  else
  puts " Now we have #{$students.count} students"
 end
    end
end

def print_header
  puts "The students of Villains Academy".center($width)
  puts "--------------".center($width)
end

def print_students
     number = 0
     until number == $students.length
     puts "#{number + 1}  #{$students[number][:name]}".ljust($width/5) + "(#{$students[number][:cohort]} cohort, hobby: #{$students[number][:hobby]}, age: #{$students[number][:age]}, Place of birth: #{$students[number][:place_of_birth]})".ljust($width/5)
     number +=1
   end
  end

def sort_by_letter(letter)
  specific_letter = []
  if letter.nil?
    puts "   It seems you didn't provide any letters to search by"
    interactive_menu
  end
  $students.each do | student |
       if student[:name].downcase.start_with?(letter)
       specific_letter << { name: student[:name] , cohort: student[:cohort], hobby: :tennis , age: '25',  place_of_birth: :UK  }
       end
    end
    if specific_letter.length == 1
      puts "   We found #{specific_letter.count} student starting with letter \"#{letter}\""
    else
      puts "   We found #{specific_letter.count} students starting with letter \"#{letter}\""
    end
      specific_letter.each.with_index(1) do | student , index |
      puts "#{index}  #{student[:name]}".ljust($width/5) + " (#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/5)
    end
end
def sort_by_length(length)
  length_arr = []
    $students.each do | student |
      if student[:name].length < length
        length_arr << { name: student[:name] , cohort: student[:cohort], hobby: :tennis , age: '25',  place_of_birth: :UK  }
        end
      end
      if length_arr.length == 0
      puts "   It seems you didn't enter any number of characters to search by"
    elsif length_arr.length == 1
      puts "   We found #{length_arr.length} student with criteria less than #{length} characters"
      else
      puts "   We found #{length_arr.length} students with criteria less than #{length} characters"
    end
    length_arr.each.with_index(1) do | student , index |
    puts "#{index}  #{student[:name]}".ljust($width/5) + "(#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/5)

  end
end


def sort_by_cohort(cohorts)
  sort = []
  cohorts.map do | x |
     students.each do |student|
       if student[:cohort] == x
        sort << student
     end
   end
 end
 if sort.count == 0
   puts "Sorry, we didn't find any students by cohort criteria"
 else
   print "List of students belong to cohort: "
   puts cohorts.each { |cohort| cohort}.join( ", ")
   sort.each.with_index(1) do | student , index |
   puts "#{index}  #{student[:name]}".ljust($width/5) + "(#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/5)
   end
  end
 end


def print_footer
  if $students.count == 0
    puts "Oops, no students to show".center($width)
  elsif $students.count == 1
  puts "We have #{1} great student".center($width)
 else
  puts "---------------------------------".center($width)
  puts "Overall, we have #{$students.count} great students".center($width)
  puts "---------------------------------".center($width)
 end
end


interactive_menu

#sort_by_cohort(students[:November]) # Edit the array which months you would like to print out
