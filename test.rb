class StudentData
    def initialize
        @hash_array = []
    end

    def create_student_array
        @hash_array = [{ student_id: 1, department: 'a1', maths: 43, physics: 54, chemistry: 65, year: 2016 },
                       { student_id: 2, department: 'a1', maths: 66, physics: 52, chemistry: 65, year: 2016 },
                       { student_id: 3, department: 'a7', maths: 87, physics: 32, chemistry: 43, year: 2016 },
                       { student_id: 1, department: 'a1', maths: 21, physics: 52, chemistry: 65, year: 2015 },
                       { student_id: 2, department: 'a1', maths: 68, physics: 50, chemistry: 65, year: 2015 },
                       { student_id: 3, department: 'a7', maths: 85, physics: 22, chemistry: 43, year: 2015 },
                       { student_id: 4, department: 'a7', maths: 21, physics: 22, chemistry: 13, year: 2016 }]
    end

    def array_push(student_object)
        @hash_array.push(student_object)
    end

    # Group_by method
    def students_group_data(group_by)
        # Group by Student_ID
        @hash_array_group_by = []
        group_by_symbol = group_by.to_sym
        if %w(student_id department year).include? group_by.downcase

            htemp_groupby = {}
            @hash_array = @hash_array.sort_by { |hsh| hsh[group_by_symbol] }
            math_total = @hash_array[0][:maths]
            physics_total = @hash_array[0][:physics]
            chemistry_total = @hash_array[0][:chemistry]
            count = 0
            (1...@hash_array.size).each do |num|
                if  @hash_array[num][group_by_symbol] == @hash_array[num - 1][group_by_symbol]

                    math_total += @hash_array[num][:maths]
                    physics_total += @hash_array[num][:physics]
                    chemistry_total +=  @hash_array[num][:chemistry]

                else
                    # puts "#{num}  #{count} "
                    no_students = num - count
                    math_average = math_total / no_students
                    physics_average = physics_total / no_students
                    chemistry_average = chemistry_total / no_students
                    # puts "Phase #{num} - #{math_total} #{physics_total} #{chemistry_total} "
                    htemp_groupby = { group_by_symbol => @hash_array[num - 1][group_by_symbol], :maths => math_average, :physics => physics_average, :chemistry => chemistry_average }
                    @hash_array_group_by.push(htemp_groupby)

                    math_total = @hash_array[num][:maths]
                    physics_total = @hash_array[num][:physics]
                    chemistry_total = @hash_array[num][:chemistry]
                    count = num

                    # puts "Phase #{num} - #{math_average} #{physics_average} #{chemistry_average} "
                end
            end
            no_students = @hash_array.size - count
            math_average = math_total / no_students
            physics_average = physics_total / no_students
            chemistry_average = chemistry_total / no_students
            htemp_groupby = { group_by_symbol => @hash_array[@hash_array.size - 1][group_by_symbol], :maths => math_average, :physics => physics_average, :chemistry => chemistry_average }
            @hash_array_group_by.push(htemp_groupby)

        else
            puts 'Enter Some valid input'
      end
  end

    # Sort_by method
    def student_sort_data(sort_by)
        if sort_by.casecmp('maths').zero? || sort_by.casecmp('physics').zero? || sort_by.casecmp('chemistry').zero?
            sort_by_symbol = sort_by.downcase.to_sym
            @hash_array_group_by = @hash_array_group_by.sort_by { |hsh| hsh[sort_by_symbol] }.reverse
        else
            puts 'Enter Some valid input'
        end
    end

    def print_student_array
        @hash_array_group_by.each do |element|
            puts element
        end
    end

    def display_student_data(display_fields, group_by, show_total)
        display_fields = display_fields.split(',')
        group_by = group_by.upcase
        total_physics = 0
        total_maths = 0
        total_chemistry = 0
        display_fields.map!(&:downcase)
        print " |   #{group_by}   "
        display_fields.each do |field|
            print " |#{field}       "
        end
        print "\n"

        @hash_array_group_by.each do |element|
            total_physics += element[:physics]
            total_maths += element[:maths]
            total_chemistry += element[:chemistry]
            print "|   #{element[element.keys[0]]}   |"
            display_fields.each do |field|
                print element[field.to_sym].to_s + '|'
            end
            print "\n"
        end # loop end

        if show_total.to_s.casecmp('TRUE').zero?
            print ' |   Total   '

            display_fields.each do |field|
                if field == 'maths'
                    print " |    #{total_maths}       "
                elsif field == 'physics'
                    print " |    #{total_physics}       "
                else
                    print "|    #{total_chemistry}      "
                end
            end
            print "\n"
       end
    end # display_student_data ends

    #  Should compare Hashes method starts
    def student_compare_data(compare_on, first_comprer_element, second_comparer_element, group_by, show_total)
        @hash_array = @hash_array.sort_by { |hsh| hsh[:year] }.reverse
        temp_arr = []
        temp_year = @hash_array[0][:year]
        final_year = 0
        (0...@hash_array.size).each do |iter|
            if  @hash_array[iter][:year] == temp_year
                temp_arr.push(@hash_array[iter][:student_id])
            else
                temp_arr.delete(@hash_array[iter][:student_id])
                final_year = @hash_array[iter][:year]
            end
        end
        array_push(student_id: temp_arr[0], department: 'a7', maths: 0, physics: 0, chemistry: 0, year: final_year)

        # Main if starts
        if compare_on.casecmp('year').zero?
            @hash_array = @hash_array.sort_by { |hsh| hsh[:student_id] }
            display_compare_student_data(first_comprer_element, second_comparer_element, group_by, show_total)
        end
        # Main if  ends
    end
    #  Should compare Hashes method ends

    #  display_compare_student_data method starts
    def display_compare_student_data(first_comprer_element, second_comparer_element, group_by, show_total)
        puts " |   #{group_by}   |    MATHS    |    PHYSICS    |    CHEMISTRY    |"
        temp = 0
        math_first_comprer_total = 0
        math_second_comprer_total = 0
        physics_first_comprer_total = 0
        physics_second_comprer_total = 0
        chemistry_first_comprer_total = 0
        chemistry_second_comprer_total = 0
        math = {}
        phys = {}
        chem = {}
        (0...@hash_array.size).each do |iter| # @hash_array.each do |element|
            if temp == 0 || @hash_array[iter][:student_id] != temp
                puts " |   #{@hash_array[iter][:student_id]} |"
                temp = @hash_array[iter][:student_id]

            end # if -else ends
            year = @hash_array[iter][:year] == first_comprer_element.to_i ? first_comprer_element : second_comparer_element
            state = @hash_array[iter][:year] == first_comprer_element.to_i ? 'curr' : 'prev'

            math['total'] = {} if math['total'].nil?
            phys['total'] = {} if phys['total'].nil?
            chem['total'] = {} if chem['total'].nil?
            math['total'][year] = math['total'][year].to_i + @hash_array[iter][:maths]
            phys['total'][year] = phys['total'][year].to_i + @hash_array[iter][:physics]
            chem['total'][year] = chem['total'][year].to_i + @hash_array[iter][:chemistry]

            math[state] = @hash_array[iter][:maths]
            phys[state] = @hash_array[iter][:physics]
            chem[state] = @hash_array[iter][:chemistry]
            # find the total sum
            next unless iter.odd?
            puts " |   #{first_comprer_element} |   #{math['curr']}  |   #{phys['curr']} |   #{chem['curr']} |"
            puts " |   #{second_comparer_element} |   #{math['prev']}  |   #{phys['prev']} |   #{chem['prev']} |"

            puts " |   Change   |   #{calculate_change(math['curr'], math['prev'])} % |   #{calculate_change(phys['curr'], phys['prev'])} % |   #{calculate_change(chem['curr'], chem['prev'])} % |"
        end # loop end

        if show_total.to_s.casecmp('TRUE').zero?
            puts " |   Total (2016)   |   #{math['total'][first_comprer_element]} |   #{phys['total'][first_comprer_element]}  |   #{chem['total'][first_comprer_element]} |"
            puts " |   Total (2015)   |   #{math['total'][second_comparer_element]} |   #{phys['total'][second_comparer_element]}  |   #{chem['total'][second_comparer_element]} |"
            puts " |   Total          |   #{math['total'][first_comprer_element] + math['total'][second_comparer_element]} |   #{phys['total'][first_comprer_element] + phys['total'][second_comparer_element]}  |   #{chem['total'][first_comprer_element] + chem['total'][second_comparer_element]} |"
        end
    end

    # display_compare_student_data ends
    def calculate_change(curr_value, prev_value)
        begin
           average = ((curr_value - prev_value) * 100 / curr_value).abs
           rescue ZeroDivisionError
               average = '-'
           end
        average
    end
end # Class ends

obj = StudentData.new
obj.create_student_array

print 'Group_by? student_id or department or year  '
group_by = gets.chomp

print 'Sort_by? maths/physics/chemistry  '
sort_by = gets.chomp

print 'Display_fields: Maths,physics,chemistry  '
display_fields = gets.chomp

print 'Should_compare? false/true '
should_compare = gets.chomp

if should_compare.to_s == 'true'
    print 'Compare_on :'
    compare_on = gets.chomp

    print 'First_comprer_element: '
    first_comprer_element = gets.chomp

    print 'Second_comparer_element: '
    second_comparer_element = gets.chomp
end

print 'Show_total? false/true  '
show_total = gets.chomp

if should_compare.to_s == 'true'
    obj.student_compare_data(compare_on, first_comprer_element, second_comparer_element, group_by, show_total)
else
    obj.students_group_data(group_by)
    obj.student_sort_data(sort_by)
    obj.display_student_data(display_fields, group_by, show_total)
end

# obj.print_student_array
