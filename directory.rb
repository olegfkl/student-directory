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

def print_students(students, letter=nil, length=0)
  length_arr = []
  if !letter.nil?
    sort_by_letter(students, letter, length)
  elsif length > 0
    students.each do | student |
        if student[:name].length < length
          length_arr << { name: student[:name] , cohort: :november }
          end
        end
        puts "We found #{length_arr.length} student(s) with criteria less than #{length} characters"
        length_arr.each.with_index(1) do | student , index |
        puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
      end
  else
     number = 0
     until number == students.length
     puts "#{number + 1} #{students[number][:name]}   (#{students[number][:cohort]} cohort)"
     number +=1
   end
  end
end

def sort_by_letter(students, letter , length)
  specific_letter = []
  students.each do | name |
    if name[:name].downcase.start_with?(letter)
       specific_letter << { name: name[:name] , cohort: :november }
     end
end
if length == 0
  puts "You entered #{specific_letter.count} student(s) starting with your criteria letter \"#{letter}\""
  specific_letter.each.with_index(1) do | name , index |
      puts "#{index} #{name[:name]} (#{name[:cohort]} cohort)"
    end
else
print_students(specific_letter, letter=nil, length )
end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
#Calling methods
print_header
print_students(students)
print_footer(students)
