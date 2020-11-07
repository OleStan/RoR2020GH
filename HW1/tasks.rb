def task_1
  puts "1 Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными."
  array = [1, 2, 3, 4, 5, 6, 7, 9]
  p array
  odd_nums = []
  even_nums = []
  array.each do |elem|
    if elem % 2 != 0
      odd_nums << elem
    else
      even_nums << elem
    end
  end
  even_nums.each { |elem| print elem, " " }
  odd_nums.each { |elem| print elem, " " }
  puts ""
  p "----------------------------------------------------"
end

def task_2
  puts "2 Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными."
  array = [1, 2, 3, 4, 5, 6, 7, 9]
  p array
  odd_nums = []
  even_nums = []
  array.each do |elem|
    if elem % 2 != 0
      odd_nums << elem
    else
      even_nums << elem
    end
  end
  odd_nums.each { |elem| print elem, " " }
  even_nums.each { |elem| print elem, " " }
  puts ""
  p "----------------------------------------------------"
end

def task_3
  puts "3 Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
  array = [-1, 3, 78, 62, 78, 4, -5, 45, 16]
  p array
  condition = false
  index_of_condition = nil
  array.each do |elem|
    if array[0] < elem and elem < array[-1]
      index_of_condition = elem
      condition = true
      break
    end
  end
  if condition == false
    puts "[]"
  else
    p array.index(index_of_condition)
  end
  p "----------------------------------------------------"
end


def task_4
  puts "4 Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
  array = [-1, 3, 78, 62, 78, 4, -5, 45, 16]
  p array
  condition = false
  index_of_condition = 1
  array.each do |elem, index|
    if array[0] < elem and elem < array[-1]
      index_of_condition = elem
      condition = true
    end
  end
  if condition == false
    puts "[]"
  else
    p array.index(index_of_condition)
  end
  p "----------------------------------------------------"
end

def task_5
  puts "5 Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  array.each do |elem|
    index = array.index(elem)
    if elem % 2 != 0 and index != 0
      array[index] = elem + array[0]
    end
  end
  p array
  p "----------------------------------------------------"
end

def task_6
  puts "6 Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  array.each do |elem|
    index = array.index(elem)
    if elem % 2 == 0 and index != 0
      array[index] = elem + array[-1]
    end
  end
  p array
  p "----------------------------------------------------"
end


def task_7
  puts "7 Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  array.each do |elem|
    index = array.index(elem)
    if elem % 2 != 0 and index != 0 and index != -1
      array[index] = elem + array[-1]
    end
  end
  p array
  p "----------------------------------------------------"
end

def task_8
  puts "8 Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  array.each do |elem|
    index = array.index(elem)
    if elem % 2 != 0 and index != 0 and index != -1
      array[index] = elem + array[0]
    end
  end
  p array
  p "----------------------------------------------------"
end

def task_9
  puts "9 Дан целочисленный массив. Заменить все положительные элементы на значение минимального."
  array = [1, -2, 3, -4, 5, -6, 7, -8, 9]
  p array
  minimum = array.min
  array.each do |elem|
    index = array.index(elem)
    if elem >= 0
      array[index] = minimum
    end
  end
  p array
  p "----------------------------------------------------"
end

def task_10
  puts "10 Дан целочисленный массив. Заменить все положительные элементы на значение максимального."
  array = [1, -2, 3, -4, 5, -6, 7, -8, 9]
  p array
  minimum = array.max
  array.each do |elem|
    index = array.index(elem)
    if elem >= 0
      array[index] = minimum
    end
  end
  p array
  p "----------------------------------------------------"
end

def task_11
  puts "11 Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального.  "
  array = [1, -2, 3, -4, 5, -6, 7, -8, 9]
  p array
  minimum = array.min
  array.each do |elem|
    index = array.index(elem)
    if elem <= 0
      array[index] = minimum
    end
  end
  p array
  p "----------------------------------------------------"
end

def task_12
  puts "12 Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального."
  array = [1, -2, 3, -4, 5, -6, 7, -8, 9]
  p array
  minimum = array.max
  array.each do |elem|
    index = array.index(elem)
    if elem <= 0
      array[index] = minimum
    end
  end
  p array
  p "----------------------------------------------------"
end

def task_13
  puts "13 Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  array_new = []
    array.each_index do |i|
      array_new << array[i-1]
    end
  p array_new
  p "----------------------------------------------------"
end


def task_14
  puts "14 Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  array_new = []
  array.each_index do |i|
    array_new << array[i-1]
    end
  p array_new
  p "----------------------------------------------------"
end




def task_15
  puts "15 Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  it_Aprogres = false
  if array.length <= 2
    it_Aprogres = true
  else
    if (array[0]-array[1]) == (array[1]-array[2])
      it_Aprogres = true
    end
  end
  if it_Aprogres
    puts "Annswer #{ (array[0] - array[1])*(-1) }"
  else
    puts "Annswer nil"
  end
  p "----------------------------------------------------"
end


def task_16
  puts "16 Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию. Если да, то вывести знаменатель прогрессии, если нет - вывести nil."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  it_Gprogres = false
  if array.length <= 2
    it_Gprogres = true
  else
    if (array[1]/array[0]) == (array[2]/array[1])
      it_Gprogres = true
    end
  end
  if it_Gprogres
    puts "Annswer #{ (array[0] / array[1]) }"
  else
    puts "Annswer nil"
  end
  p "----------------------------------------------------"
end


def task_17
puts "17 Дан целочисленный массив. Найти количество его локальных максимумов."
array = [1, 1, 3, 1, 5, 2, 7, 8, 9]
p array
count_of_max = 0
for i in 1..array.length-2
  if array[i-1] < array[i] and array[i] > array[i+1]
    count_of_max += 1
  end
end
puts "Maximal quantity = #{ count_of_max }"
p "----------------------------------------------------"
end

def task_18
  puts "18 Дан целочисленный массив. Найти количество его локальных минимумов."
  array = [1, 2, 3, 1, 5, 2, 7, 3, 9]
  p array
  count_of_min = 0
  for i in 1..array.length-2
    if array[i-1] > array[i] and array[i] < array[i+1]
      count_of_min += 1
    end
  end
  puts "Minimal quantity = #{ count_of_min }"
  p "----------------------------------------------------"
end

def task_19
  puts "19 Дан целочисленный массив. Найти максимальный из его локальных максимумов."
  array = [1, 1, 3, 1, 5, 2, 7, 8, 9]
  p array
  count_of_max = []
  for i in 1..array.length-2
    if array[i-1] < array[i] and array[i] > array[i+1]
      count_of_max << array[i]
    end
  end
  puts "Maximal in local max = #{ count_of_max.max }"
  p "----------------------------------------------------"
end

def task_20
  puts "20 Дан целочисленный массив. Найти минимальный из его локальных минимумов."
  array = [1, 2, 3, 1, 5, 2, 7, 3, 9]
  p array
  count_of_min = []
  for i in 1..array.length-2
    if array[i-1] > array[i] and array[i] < array[i+1]
      count_of_min << array[i]
    end
  end
  puts "Minimal in local min = #{ count_of_min.min }"
  p "----------------------------------------------------"
end


def task_21
  puts "21 Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают."
  array = [1, 2, 3, 4, 4, 3, 2, 1, 1, 2, 3]
  p array
  count_cof = 0
  count_spins = 0
  for i in 0 .. array.length - 2
    if count_spins != -1
      count_spins -= 1
    else
      if array[i] - array[i + 1] < 0
        for s in i .. array.length - 2
          if array[i] - array[i + 1] < 0
            count_spins += 1
          end
          count_cof += 1
          break
        end
      end
    end
  end
  p "Count of monogrow = #{ count_cof }"
  p "----------------------------------------------------"
end


def task_22
  puts "22 Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно убывают."
    array = [1, 2, 3, 4, 4, 3, 2, 1, 1, 2, 3]
    p array
    count_spins=-1
    count_cof = 0
    for i in 0..array.length-2
      if count_spins != -1
        count_spins -= 1
      else
        if array[i]-array[i+1] > 0
          for s in i..array.length-2
            if array[i]-array[i+1] > 0
              count_spins+=1
            end
            count_spins+=1
            count_cof +=1
            break
          end
        end
      end
    end
    p "Count of monodown = #{ count_cof }"
    p "----------------------------------------------------"
end





def task_23
  puts "23 Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу."
  k = 5
  puts "K = #{k}"
  array = [1, 2, 3, 6, 7, 8, 9]
  p array
  for i in 1..[array.min.abs, array.max.abs].max
    if array.include? k+i
      puts "Nearest is #{k+1}"
      break
    if array.include? k-i
      puts "Nearest is #{k-1}"
      break

    end
    end
  end
  p "----------------------------------------------------"
end

def task_24
  puts "24 Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу."
  k = 5
  puts "K = #{k}"
  array = [1, 2, 3, 6, 7, 8, 9]
  p array
  if array.min - k > array.max - k
        puts "Farest is #{array.min}"
  else
    puts "Farest is #{array.max}"
    p "----------------------------------------------------"
    end
  end

def task_25
  puts "25 Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент."
  array = [1, -2, -3, 4, -5, 6, 7, 8, -9]
  p array
  new_array = []
  array.each do |elem|
    if elem > 0
      new_array.push(array[0], elem)
    else
      new_array<<elem
    end
  end
  puts "Ready array = #{new_array}"
  p "----------------------------------------------------"
end


def task_26
  puts "26 Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент."
  array = [1, -2, -3, 4, -5, 6, 7, 8, -9]
  p array
  new_array = []
  array.each do |elem|
    if elem < 0
      new_array.push(array[0], elem)
    else new_array << elem
    end
  end
  puts "Ready array = #{new_array}"
  p "----------------------------------------------------"
end



def task_27
puts "27 Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент."
array = [1, -2, -3, 4, -5, 6, 7, 8, -9]
p array
new_array = []
array.each do |elem|
  if elem > 0
    new_array.push(elem, array[0])
  else new_array << elem
  end
end
puts "Ready array = #{new_array}"
p "----------------------------------------------------"
end


def task_28
  puts "28 Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент."
  array = [1, -2, -3, 4, -5, 6, 7, 8, -9]
  p array
  new_array = []
  array.each do |elem|
    if elem < 0
      new_array.push(elem, array[0])
    else new_array << elem
    end
  end
  puts "Ready array = #{new_array}"
  p "----------------------------------------------------"
end

def task_29
  puts "29 Дан целочисленный массив. Упорядочить его по возрастанию."
  array = Array.new(10) { rand(-50...50) }
  p array
  puts "Ready array = #{array.sort}"
  p "----------------------------------------------------"
end

def task_30
  puts "30 Дан целочисленный массив. Упорядочить его по убыванию."
  array = Array.new(10) { rand(-50...50) }
  p array
  puts "Ready array = #{array.sort.reverse}"
  p "----------------------------------------------------"
end


def task_31
  puts "31 Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность."
  array = Array.new(10) { rand(-50...50) }
  p array
  answer = []
  new_array = array.sort.reverse
  new_array.each { |elem| answer << array.index(elem) }
  puts"Index array #{answer}"
  p "----------------------------------------------------"
end

def task_32
  puts "32 Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют возрастающую последовательность."
  array = Array.new(10) { rand(-50...50) }
  p array
  answer = []
  new_array  = array.sort
  new_array.sort.each { |elem| answer << array.index(elem) }
  puts"Index array #{answer}"
  p "----------------------------------------------------"
end



def task_33
puts "33 Дан целочисленный массив. Найти индекс минимального элемента."
array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p array
puts ("Min element index = #{array.index(array.min)}" )
p "----------------------------------------------------"
end


def task_34
  puts "34 Дан целочисленный массив. Найти индекс максимального элемента."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  puts ("Max element index = #{array.index(array.max)}" )
  p "----------------------------------------------------"
end

def task_35
  puts "35 Дан целочисленный массив. Найти индекс первого минимального элемента."
  array = [1, 2, 3, 1, 5, 6, 7, 8, 9]
  p array
  puts ("First min element index = #{array.index(array.min)}" )
  p "----------------------------------------------------"
end


def task_36
  puts "36 Дан целочисленный массив. Найти индекс первого максимального элемента."
  array = [1, 2, 3, 9, 5, 6, 7, 8, 9]
  p array
  puts ("First max element index = #{array.index(array.max)}" )
  p "----------------------------------------------------"
end


def task_37
  puts "37 Дан целочисленный массив. Найти индекс последнего минимального элемента."
  array = [1, 2, 3, 1, 5, 6, 7, 8, 9]
  p array
  min_elem = array.min
  min_index = array.index(min_elem)
  array.delete_at(min_index)
  if array.include?(array.min)
    puts "Last min element index = #{array.index(array.min)+1}"
  else
    puts "Last min element index = #{min_index}"
  end
  p "----------------------------------------------------"
end


def task_38
  puts "38 Дан целочисленный массив. Найти индекс последнего максимального элемента."
  array = [1, 2, 3, 9, 5, 6, 7, 8, 9]
  p array
  max_elem = array.max
  max_index = array.index(max_elem)
  array.delete_at(max_index)
  if array.include?(array.max)
    puts "Last max element index = #{array.index(array.max)+1}"
  else
    puts "Last max element index = #{max_index}"
  end
  p "----------------------------------------------------"
end



def task_39
  puts "39 Дан целочисленный массив. Найти количество минимальных элементов."
  array = [1, 2, 3, 9, 5, 6, 7, 8, 9]
  p array
  puts "Count of min element #{array.count{ |i| i == array.min }}"
end

def task_40
  puts "40 Дан целочисленный массив. Найти количество максимальных элементов."
  array = [1, 2, 3, 9, 5, 6, 7, 8, 9]
  p array
  puts "Count of min element #{array.count{ |i| i == array.max }}"
end

def task_41
  puts "41 Дан целочисленный массив. Найти минимальный четный элемент."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  puts "Minimal even element = #{array.select{|i| i.even?}.min}"
  p "----------------------------------------------------"
end

def task_42
  puts "42 Дан целочисленный массив. Найти минимальный нечетный элемент."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  puts "Minimal odd element = #{array.select{|i| i.odd?}.min}"
  p "----------------------------------------------------"
end

def task_43
  puts "43 Дан целочисленный массив. Найти максимальный четный элемент."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  puts "Maximal even element = #{array.select{|i| i.even?}.max}"
  p "----------------------------------------------------"
end

def task_44
  puts "43 Дан целочисленный массив. Найти максимальный нечетный элемент."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  puts "Maximal odd element = #{array.select{|i| i.odd?}.max}"
  p "----------------------------------------------------"
end

def task_45
  puts "45 Дан целочисленный массив. Найти минимальный положительный элемент."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  puts "Minimal positive element = #{array.select{|i| i.positive?}.min}"
  p "----------------------------------------------------"
end

def task_46
  puts "46 Дан целочисленный массив. Найти максимальный отрицательный элемент.."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  p "Maximal negative element = #{array.select{|i| i.negative?}.max}"
  p "----------------------------------------------------"
end

def task_47
  puts "47 Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  inter = [2, 6]
  puts "a = #{inter[0]}        b = #{inter[1]}"
  puts "Minimal in a..d interval is #{array[inter[0]..inter[1]].min}"
  p "----------------------------------------------------"
end

def task_48
  puts "48 Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array
  inter = [2, 6]
  puts "a = #{inter[0]}        b = #{inter[1]}"
  puts "Minimal in a..d interval is #{array[inter[0]..inter[1]].max}"
  p "----------------------------------------------------"
end

def task_49
puts "49 Дан целочисленный массив. Найти количество элементов, расположенных перед первым минимальным."
array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p array

puts "Quantity elements befor minimal #{array.length[0..array.index(array.min)]-1}"
p "----------------------------------------------------"
end

def task_50
  puts "50 Дан целочисленный массив. Найти количество элементов, расположенных перед первым максимальным."
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  p array

  puts "Quantity elements befor minimal #{array.length[0..array.index(array.max)]-1}"
  p "----------------------------------------------------"
end



 task_1()
 task_2()
 task_3()
 task_4()
 task_5()
 task_6()
 task_7()
 task_8()
 task_9()
 task_10()
 task_11()
 task_12()
 task_13()
 task_14()
 task_15()
 task_16()
 task_17()
 task_18()
 task_19()
 task_20()
 task_21()
 task_22()
 task_23()
 task_24()
 task_25()
 task_26()
 task_27()
 task_28()
 task_29()
 task_30()
 task_31()
 task_32()
 task_33()
 task_34()
 task_35()
 task_36()
 task_37()
 task_38()
 task_39()
 task_40()
 task_41()
 task_42()
 task_43()
 task_44()
 task_45()
 task_46()
 task_47()
 task_48()
 task_49()
 task_50()

