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

def print_students(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
#Calling methods
print_header
print_students(students)
print_footer(students)
