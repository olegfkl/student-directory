def input_students
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty?
    students << { name: name , cohort: :november }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_students(students, letter=nil)
  if !letter.nil?
    sort_by_letter(students, letter)
  else
    students.each.with_index(1) do | student , index |
    puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def sort_by_letter(students, letter)
  specific_letter = []
  students.each do | name |
    if name[:name].downcase.start_with?(letter)
       specific_letter << { name: name[:name] , cohort: :november }
    end
  end
  puts "You entered #{specific_letter.count} student(s) starting with your criteria letter \"#{letter}\""
  specific_letter.each.with_index(1) do | name , index |
      puts "#{index} #{name[:name]} (#{name[:cohort]} cohort)"
    end
  end



def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
#Calling methods
print_header
print_students(students, 'b')
print_footer(students)


#Modify your program to only print the students whose name begins with a specific letter.

#Modify your program to only print the students whose name is shorter than 12 characters.
