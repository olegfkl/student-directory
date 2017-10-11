$width = 60
def input_students
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty?
    students << { name: name.capitalize , cohort: :november, hobby: :tennis , age: 25,  place_of_birth: :UK}
    puts "Now we have #{students.count} students"
    name = gets.chomp
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
     until number == students.length
     puts "#{number + 1} #{students[number][:name]}".ljust($width/3) + "(#{students[number][:cohort]} cohort, hobby: #{students[number][:hobby]}, age: #{students[number][:age]}, Place of birth: #{students[number][:place_of_birth]} )".ljust($width/3)
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
      puts "#{index} #{student[:name]}".ljust($width/3) + " (#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/3)
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
      puts "#{index} #{student[:name]}".ljust($width/3) + "(#{student[:cohort]} cohort, hobby: #{student[:hobby]}, age: #{student[:age]}, Place of birth: #{student[:place_of_birth]})".ljust($width/3)
    end
end




def print_footer(names)
  puts "Overall, we have #{names.count} great students".center($width)
end
students = input_students
#Calling methods
print_header
print_students(students, 'a' , 5)
print_footer(students)
