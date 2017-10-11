$width = 50
def input_students
  students = []
  puts "Please enter your students' names along with other information about them"
  puts "To finish, just hit return twice"
  while true
  print "Student name:\n"
  name = gets.chomp
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
  students << { name: name.capitalize , cohort: cohort.capitalize , hobby: :tennis , age: 25,  place_of_birth: :UK}
  if students.count == 1
  puts "Now we have #{1} student"
else
  puts "Now we have #{students.count} students"
end
    end
  students
end

def print_header
  puts "The students of Villains Academy".center($width)
  puts "--------------".center($width)
end

def print_students(students, letter=nil, length=0)
  if !letter.nil?
    sort_by_letter(students, letter , length)
  elsif length > 0
    sort_by_length(students, length)
  else
     number = 0
     until number == students.length
     puts "#{number + 1} #{students[number][:name]}".ljust($width/5) + "(#{students[number][:cohort]} cohort, hobby: #{students[number][:hobby]}, age: #{students[number][:age]}, Place of birth: #{students[number][:place_of_birth]})".ljust($width/5)
     number +=1
   end
  end
end

def sort_by_letter(students, letter , length)
  specific_letter = []
  students.each do | student |
    if student[:name].downcase.start_with?(letter)
       specific_letter << { name: student[:name] , cohort: :november, hobby: :tennis , age: '25',  place_of_birth: :UK  }
       end
    end
  puts "You entered #{specific_letter.count} student(s) starting with letter \"#{letter}\""
  if length == 0
    specific_letter.each.with_index(1) do | student , index |
      puts "#{index} #{student[:name]}".ljust($width/5) + " (#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/5)
    end
  else
    sort_by_length(specific_letter, length)
  end
end
def sort_by_length(students, length)
  length_arr = []
    students.each do | student |
      if student[:name].length < length
        length_arr << { name: student[:name] , cohort: :november, hobby: :tennis , age: '25',  place_of_birth: :UK  }
        end
      end
      puts "We found #{length_arr.length} student(s) with criteria less than #{length} characters"
      length_arr.each.with_index(1) do | student , index |
      puts "#{index} #{student[:name]}".ljust($width/5) + "(#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/5)
    end
end

def sort_by_cohort(students, cohorts)
  sort = []
  cohorts.map do | x |
     students.each do |student|
       if student[:cohort] == x.capitalize
        sort << student
     end
   end
 end
 if sort.count == 0
   puts "Sorry, we didn't find any students by cohort criteria"
 else
   print "List of students belong to cohort: "
   puts cohorts.each { |cohort| cohort.capitalize! }.join( ", ")
   sort.each.with_index(1) do | student , index |
   puts "#{index} #{student[:name]}".ljust($width/5) + "(#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/5)
   end
  end
 end


def print_footer(names)
  if names.count == 0
    puts "Oops, no students to show".center($width)
  elsif names.count == 1
  puts "We have #{1} great student".center($width)
 else
  puts "Overall, we have #{names.count} great students".center($width)
 end
end
students = input_students
#Calling methods
print_header
print_students(students)
sort_by_cohort(students, ['october','november']) # Edit the array which months you would like to print out
print_footer(students)
