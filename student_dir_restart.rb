
@students =[ ]

def print_header 
	return "Welcome to the Makers Academy student directory".center(80)
end


def print_menu
		puts "1. input the students"
		puts "2. show the students"
		puts "9. exit"
end


def interactive_menu
	loop do	
			print_menu
			process(gets.chomp)
	end
end


def process(selection)
		case selection 
		when "1"
			input_students
		when "2"
			show_students
		when "9"
			exit 
		else
			puts "I don't know what you meant, try again"
		end
end

 
def input_students
	puts "Please enter the name of the students".center(80)
	puts " To exit, hit return twice".center(80)

	name = gets.chomp.capitalize

	while !name.empty? do 
		students << {:name => name}
		puts "Now we have #{@students.length} students".center(80)
		puts "Please input next name, to exit hit return twice".center(80)
		name = gets.chomp.capitalize	
	end

	students

end


def print_students_list
		i=0
		@students.each_with_index do |student, i|
		puts "#{i+=1}: #{student[:name]}".center(80)
	end	
end


def print_footer
 "overall we have #{@students.length} great students".center(80)
end


def show_students
	print_header
	print(students)
	print_footer(students)
end

interactive_menu