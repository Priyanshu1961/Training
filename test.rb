class TestClass

    def initialize
      @hash_array=Array.new
    end

    def create_hashArray
              h=Hash.new
              h= { :student_id => 1, :department => "a1", :maths => 43, :physics => 54 , :chemistry => 65, :year => 2016 }
              arraypush(h)
              h= { :student_id => 2, :department => "a1", :maths => 66, :physics => 52 , :chemistry => 65, :year => 2016 }
              arraypush(h)
              h= { :student_id => 3, :department => "a7", :maths => 87, :physics => 32 , :chemistry => 43, :year => 2016 }
              arraypush(h)
              h= { :student_id => 1, :department => "a1", :maths => 21, :physics => 52 , :chemistry => 65, :year => 2015 }
              arraypush(h)
              h= { :student_id => 2, :department => "a1", :maths => 68, :physics => 50 , :chemistry => 65, :year => 2015 }
              arraypush(h)
              h= { :student_id => 3, :department => "a7", :maths => 85, :physics => 22 , :chemistry => 43, :year => 2015 }
              arraypush(h)
              h= { :student_id => 4, :department => "a7", :maths => 21, :physics => 22 , :chemistry => 13, :year => 2016 }
              arraypush(h)
    end

    def arraypush(hashobject)
      @hash_array.push(hashobject)
    end

    # Group_by method
       def group_hashes(group_by)
           # Group by Student_ID
             @hash_array_groupby=Array.new
         if(group_by.downcase=="student_id")

            htemp_groupby=Hash.new
            @hash_array= @hash_array.sort_by { |hsh| hsh[:student_id] }
            math_total= @hash_array[0][:maths]
            physics_total=@hash_array[0][:physics]
            chemistry_total=@hash_array[0][:chemistry]
            count=0
            for num in 1...@hash_array.length

                    if  num< @hash_array.length && @hash_array[num][:student_id] == @hash_array[num-1][:student_id]

                    math_total=math_total+ @hash_array[num][:maths]
                    physics_total=physics_total+ @hash_array[num][:physics]
                    chemistry_total=chemistry_total+ @hash_array[num][:chemistry]

                  else
                    # puts "#{num}  #{count} "
                    math_average=(math_total)/(num-count)
                    physics_average=(physics_total)/(num-count)
                    chemistry_average=(chemistry_total)/(num-count)
                    # puts "Phase #{num} - #{math_total} #{physics_total} #{chemistry_total} "
                    htemp_groupby={ :student_id => @hash_array[num-1][:student_id], :maths => math_average, :physics => physics_average , :chemistry => chemistry_average }
                    @hash_array_groupby.push(htemp_groupby)

                    math_total= @hash_array[num][:maths]
                    physics_total=@hash_array[num][:physics]
                    chemistry_total=@hash_array[num][:chemistry]
                    count=num

                     # puts "Phase #{num} - #{math_average} #{physics_average} #{chemistry_average} "
                  end

            end
            # puts "#{@hash_array.length}  #{count} "
            math_average=(math_total)/(@hash_array.length-count)
            physics_average=(physics_total)/(@hash_array.length-count)
            chemistry_average=(chemistry_total)/(@hash_array.length-count)
            htemp_groupby={ :student_id => @hash_array[@hash_array.length-1][:student_id], :maths => math_average, :physics => physics_average , :chemistry => chemistry_average }
            @hash_array_groupby.push(htemp_groupby)



          # Group by department
          elsif(group_by.downcase=="department")

             htemp_department=Hash.new
             @hash_array= @hash_array.sort_by { |hsh| hsh[:department] }
             math_total= @hash_array[0][:maths]
             physics_total=@hash_array[0][:physics]
             chemistry_total=@hash_array[0][:chemistry]
             count=0

             for num in 1...@hash_array.length

                     if  num< @hash_array.length && @hash_array[num][:department] == @hash_array[num-1][:department]

                     math_total=math_total+ @hash_array[num][:maths]
                     physics_total=physics_total+ @hash_array[num][:physics]
                     chemistry_total=chemistry_total+ @hash_array[num][:chemistry]

                   else
                     # puts "#{num}  #{count} "
                     math_average=(math_total)/(num-count)
                     physics_average=(physics_total)/(num-count)
                     chemistry_average=(chemistry_total)/(num-count)
                     # puts "Phase #{num} - #{math_total} #{physics_total} #{chemistry_total} "
                     htemp_department={ :department => @hash_array[num-1][:department], :maths => math_average, :physics => physics_average , :chemistry => chemistry_average }
                     @hash_array_groupby.push(htemp_department)

                     math_total= @hash_array[num][:maths]
                     physics_total=@hash_array[num][:physics]
                     chemistry_total=@hash_array[num][:chemistry]
                     count=num

                      # puts "Phase #{num} - #{math_average} #{physics_average} #{chemistry_average} "
                   end

             end
             # puts "#{@hash_array.length}  #{count} "
             math_average=(math_total)/(@hash_array.length-count)
             physics_average=(physics_total)/(@hash_array.length-count)
             chemistry_average=(chemistry_total)/(@hash_array.length-count)
             htemp_department={ :department => @hash_array[@hash_array.length-1][:department], :maths => math_average, :physics => physics_average , :chemistry => chemistry_average }
             @hash_array_groupby.push(htemp_department)



          # Group by Year
          elsif(group_by.downcase=="year")

             htemp_year=Hash.new
             @hash_array= @hash_array.sort_by { |hsh| hsh[:year] }
             math_total= @hash_array[0][:maths]
             physics_total=@hash_array[0][:physics]
             chemistry_total=@hash_array[0][:chemistry]
             count=0

             for num in 1...@hash_array.length

                     if  num< @hash_array.length && @hash_array[num][:year] == @hash_array[num-1][:year]

                     math_total=math_total+ @hash_array[num][:maths]
                     physics_total=physics_total+ @hash_array[num][:physics]
                     chemistry_total=chemistry_total+ @hash_array[num][:chemistry]

                   else
                     # puts "#{num}  #{count} "
                     math_average=(math_total)/(num-count)
                     physics_average=(physics_total)/(num-count)
                     chemistry_average=(chemistry_total)/(num-count)
                     # puts "Phase #{num} - #{math_total} #{physics_total} #{chemistry_total} "
                     htemp_year={ :year => @hash_array[num-1][:year], :maths => math_average, :physics => physics_average , :chemistry => chemistry_average }
                     @hash_array_groupby.push(htemp_year)

                     math_total= @hash_array[num][:maths]
                     physics_total=@hash_array[num][:physics]
                     chemistry_total=@hash_array[num][:chemistry]
                     count=num

                      # puts "Phase #{num} - #{math_average} #{physics_average} #{chemistry_average} "
                   end

             end
             # puts "#{@hash_array.length}  #{count} "
             math_average=(math_total)/(@hash_array.length-count)
             physics_average=(physics_total)/(@hash_array.length-count)
             chemistry_average=(chemistry_total)/(@hash_array.length-count)
             htemp_year={ :year => @hash_array[@hash_array.length-1][:year], :maths => math_average, :physics => physics_average , :chemistry => chemistry_average }
            @hash_array_groupby.push(htemp_year)

        else
          puts "Enter Some valid input"
       end

    end
     # Sort_by method
       def sort_hashes(sort_by)
          if(sort_by.downcase=="maths")
             @hash_array_groupby= @hash_array_groupby.sort_by { |hsh| hsh[:maths] }.reverse

          elsif (sort_by.downcase=="physics")
            @hash_array_groupby= @hash_array_groupby.sort_by { |hsh| hsh[:physics] }.reverse

          elsif(sort_by.downcase=="chemistry")
            @hash_array_groupby= @hash_array_groupby.sort_by { |hsh| hsh[:chemistry] }.reverse
          else
             puts "Enter Some valid input"

        end
       end

    def print_hashArray
         @hash_array.each do |element|
             puts element
        end
    end

    def display_hashes(display_fields,group_by,show_total)
        display_fields=display_fields.split(",")
        group_by=group_by.upcase
        total_physics=0
        total_maths=0
        total_chemistry=0
        if display_fields.size==1
             display_fields[0]=display_fields[0].upcase


           puts " |   #{group_by}   |    #{display_fields[0]}      |"
          if display_fields[0]=="PHYSICS"
                 @hash_array_groupby.each do |element|
                      total_physics=total_physics+element[:physics]
                      puts " |   #{element[element.keys[0]]}   |    #{element[:physics]}      |"
                    end  # loop end
                    if show_total.to_s.upcase=="TRUE"
                    puts " |   Total   |    #{total_physics}      |"
                  end
            elsif display_fields[0]=="MATHS"
                   @hash_array_groupby.each do |element|
                        total_maths=total_maths+element[:maths]
                        puts " |   #{element[element.keys[0]]}   |    #{element[:maths]}      |"
                       end  # loop end
                        if show_total.to_s.upcase=="TRUE"
                         puts " |   Total   |    #{total_maths}      |"
                       end
            elsif display_fields[0]=="CHEMISTRY"
                   @hash_array_groupby.each do |element|
                         total_chemistry=total_chemistry+element[:chemistry]
                         puts " |   #{element[element.keys[0]]}   |    #{element[:chemistry]}      |"
                        end  # loop end
                        if show_total.to_s.upcase=="TRUE"
                         puts " |   Total   |    #{total_chemistry}      |"
                       end
           end  # if-else end
         elsif display_fields.size==2
           display_fields[0]=display_fields[0].upcase
           display_fields[1]=display_fields[1].upcase
           puts " |   #{group_by}   |    #{display_fields[0]}      |    #{display_fields[1]}      |"
           if display_fields.include?("PHYSICS") && display_fields.include?("MATHS")
                  @hash_array_groupby.each do |element|
                       total_maths=total_maths+element[:maths]
                       total_physics=total_physics+element[:physics]
                       puts " |   #{element[element.keys[0]]}   |    #{element[:maths]}      |    #{element[:physics]}      |"
                     end  # loop end
                    if show_total.to_s.upcase=="TRUE"
                     puts " |   Total   |    #{total_maths}      |    #{total_physics}      |"
                   end
             elsif display_fields.include?("CHEMISTRY") && display_fields.include?("MATHS")
                    @hash_array_groupby.each do |element|
                          total_maths=total_maths+element[:maths]
                          total_chemistry=total_chemistry+element[:chemistry]
                         puts " |   #{element[element.keys[0]]}   |    #{element[:maths]}      |    #{element[:chemistry]}      |"
                        end  # loop end
                        if show_total.to_s.upcase=="TRUE"
                        puts " |   Total   |    #{total_maths}      |    #{total_chemistry}      |"
                      end
             elsif display_fields.include?("CHEMISTRY") && display_fields.include?("PHYSICS")
                    @hash_array_groupby.each do |element|
                          total_physics=total_physics+element[:physics]
                          total_chemistry=total_chemistry+element[:chemistry]
                          puts " |   #{element[element.keys[0]]}   |    #{element[:physics]}      |    #{element[:chemistry]}      |"
                         end  # loop end
                         if show_total.to_s.upcase=="TRUE"
                         puts " |   Total   |    #{total_physics}      |    #{total_chemistry}      |"
                       end
            end  # if-else end
         else
           puts " |   #{group_by}   |    #{display_fields[0]}      |    #{display_fields[1]}      |    #{display_fields[2]}      |"
           @hash_array_groupby.each do |element|
                 total_maths=total_maths+element[:maths]
                 total_physics=total_physics+element[:physics]
                 total_chemistry=total_chemistry+element[:chemistry]
                 puts " |   #{element[element.keys[0]]}   |    #{element[:maths]}      |    #{element[:physics]}      |    #{element[:chemistry]}      |"
                end  # loop end
                if show_total.to_s.upcase=="TRUE"
                puts " |   Total     |  #{total_maths}      |    #{total_physics}      |    #{total_chemistry}      |"
              end
         end
       end # display_hashes ends
      #  Should compare Hashes method starts
    def compare_hashes(compare_on,first_comprer_element,second_comparer_element,group_by,show_total)

      @hash_array= @hash_array.sort_by { |hsh| hsh[:year] }.reverse
       temp_arr=Array.new
       count=0
       temp_year=@hash_array[0][:year]
       final_year=0
        @hash_array.each do |element|
          count=count+1
          if count==1
           temp_arr.push(element[:student_id])
         elsif element[:year]==temp_year
            temp_arr.push(element[:student_id])
         else
          temp_arr.delete(element[:student_id])
          final_year=element[:year]
        end
      end
      arraypush({ :student_id => temp_arr[0], :department => "a7", :maths => 0, :physics => 0 , :chemistry => 0, :year => final_year })

       # Main if starts
      if compare_on.downcase=="year"
            @hash_array= @hash_array.sort_by { |hsh| hsh[:student_id] }
            compare_hashes_display(first_comprer_element,second_comparer_element,group_by,show_total)
     end
       # Main if  ends
    end
      #  Should compare Hashes method ends

      #  compare_hashes_display method starts
    def compare_hashes_display(first_comprer_element,second_comparer_element,group_by,show_total)
                puts " |   #{group_by}   |    MATHS    |    PHYSICS    |    CHEMISTRY    |"
                temp=0
                count=0
                math_curr=0
                physics_curr=0
                chemistry_curr=0
                math_prev=0
                physics_prev=0
                chemistry_prev=0
                math_2016_total=0
                math_2015_total=0
                physics_2016_total=0
                physics_2015_total=0
                chemistry_2016_total=0
                chemistry_2015_total=0
                @hash_array.each do |element|
                   count=count+1
                   if temp==0 || element[element.keys[0]]!=temp
                     puts " |   #{element[element.keys[0]]} |"
                     temp=element[element.keys[0]]

                    end # if -else ends

                     if element[:year]==first_comprer_element.to_i
                       math_curr=element[:maths]
                       physics_curr=element[:physics]
                       chemistry_curr=element[:chemistry]
                       # find the total sum
                       math_2016_total=math_2016_total+element[:maths]
                       physics_2016_total=physics_2016_total+element[:physics]
                       chemistry_2016_total=chemistry_2016_total+element[:chemistry]

                       puts " |   #{first_comprer_element} |   #{element[:maths]}  |   #{element[:physics]} |   #{element[:chemistry]} |"
                     elsif element[:year]==second_comparer_element.to_i
                       math_prev=element[:maths]
                       physics_prev=element[:physics]
                       chemistry_prev=element[:chemistry]
                       # find the total sum
                       math_2015_total=math_2015_total+element[:maths]
                       physics_2015_total=physics_2015_total+element[:physics]
                       chemistry_2015_total=chemistry_2015_total+element[:chemistry]

                       puts " |   #{second_comparer_element} |   #{element[:maths]}  |   #{element[:physics]} |   #{element[:chemistry]} |"
                      end

                      if count % 2==0 || count==@hash_array.length
                        puts " |   Change   |   #{((math_curr-math_prev)*100/math_curr).abs} % |   #{((physics_curr-physics_prev)*100/physics_curr).abs} % |   #{((chemistry_curr-chemistry_prev)*100/chemistry_curr).abs} % |"
                end
            end  # loop end
            if show_total.to_s.upcase=="TRUE"
         puts " |   Total (2016)   |   #{math_2016_total} |   #{physics_2016_total}  |   #{chemistry_2016_total} |"
         puts " |   Total (2016)   |   #{math_2015_total} |   #{physics_2015_total}  |   #{chemistry_2015_total} |"
         puts " |   Total          |   #{math_2016_total+math_2015_total} |   #{physics_2016_total+physics_2015_total}  |   #{chemistry_2016_total+chemistry_2015_total} |"
       end
     end
      # compare_hashes_display ends


end   # Class ends





obj=TestClass.new
obj.create_hashArray

print "Group_by? student_id or department or year  "
group_by=gets.chomp

print "Sort_by? maths/physics/chemistry  "
sort_by=gets.chomp

print "Display_fields: Maths,physics,chemistry  "
display_fields=gets.chomp

print "Should_compare? false/true "
should_compare=gets.chomp

if should_compare.to_s=='true'
  print "Compare_on :"
  compare_on=gets.chomp

  print "First_comprer_element: "
  first_comprer_element=gets.chomp

  print "Second_comparer_element: "
  second_comparer_element=gets.chomp
end

print "Show_total? false/true  "
show_total=gets.chomp

if should_compare.to_s=='true'
   obj.compare_hashes(compare_on,first_comprer_element,second_comparer_element,group_by,show_total)
else
  obj.group_hashes(group_by)
  obj.sort_hashes(sort_by)
  obj.display_hashes(display_fields,group_by,show_total)
end


#obj.print_hashArray
