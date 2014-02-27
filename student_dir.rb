
MONTHS = ["January", "February" , "March", "April", "May", "June", "July" ,"August", "September","October","November", "December"]
@students = []

def get_student_details 
students = [ ]
	puts "Please enter your first name or type".center(80)
			firstname = gets.chomp.capitalize

		while firstname.empty? do
			puts "Please enter your first name to proceed on with the registration process"
			firstname = gets.chomp.capitalize
		end

	puts  "Please enter your last name".center(80)
	lastname = gets.chomp.capitalize

		if lastname.empty?
			puts "NO INPUT"
			lastname = "NO INPUT"
		end

	puts  "Please enter the month that you joined makers (please spell out the entire month)".center(80)
	month = gets.chomp.capitalize

		while !MONTHS.include?(month) do
			puts "Oops, I think you made a spelling mistake".center(80)
			month = gets.chomp.capitalize		
		end

	puts "please enter the year that you joined makers (YYYY)".center(80)
	year = gets.chomp

		if year.empty?
			puts "NO INPUT"
			year = "NO INPUT" 
		end

		student = {:firstname => firstname, :surname => lastname, :cohortmonth => month.to_sym , :cohortyear => year.to_sym}

		@students << student
		puts "you are the number #{@students.length} on the alumni registration list ".center(80)

end


def input_students
	puts "Welcome to MA's student's directory registration, please enter your details".center(80)	
	get_student_details
	puts "to register next person, press any key . To exit, enter 'N' ".center(80)
	input = gets.chomp
	while input != "N"
		get_student_details
		puts "to register next person, press any key . To exit, enter 'N' ".center(80)
		input = gets.chomp
	end
	@students
end
	
def print_header
	puts "These are the students from Makers Academy that have registered: ".center(80)
end




def print_students(students)

	ordered_students = []

	MONTHS.each do |month|

		students.each do |student|
			ordered_students << student if student[:cohortmonth].to_s == month
		end
	end

	ordered_students.each_with_index do |student, i|
	puts "#{i+1} : #{student[:firstname]} #{student[:surname]} #{student[:cohortmonth]} #{student[:cohortyear]}"
	end

end


def print_footer(names)
	
	if "#{names.length} == 1"
		puts "#{names.length} student registered".center(80)
	else 
		puts "#{names.length} students registered".center(80)
	end
end


students = input_students
print_header
print_students(students)
print_footer(students)
