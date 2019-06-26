class Inference
  def initialize(name, path)
    @name = name
    @results = File.readlines(path, encoding: "UTF-8")
  end

  # Очищаем экран.
  def cls
    system("cls") || system("clear")
  end

  # Выводим информацию о программе.
  def print_version(number)
    cls
    puts "Тест \"Ваш уровень общительности\". Версия #{number}.\n\n"
  end

  # Определяем наличие ввода имени.
  def name_empty?
    @name == "" || @name == nil
  end

  # Здороваемся с учетом ввода имени.
  def say_hi
    appeal = 'Здравствуйте'
    appeal += name_empty? ? '.' : ", #{@name.capitalize}."

    puts appeal
    puts "Вашему вниманию предлагается несколько простых вопросов. " \
         "Отвечайте быстро и однозначно."
  end

  def print_result(test)
    cls

    # В зависимости от полученного positive_answers записываем \
    # в переменную result, соответствующий элемент массива results.
    result = case test.positive_answers
             when 0..3 then @results[6]
             when 4..8 then @results[5]
             when 9..13 then @results[4]
             when 14..18 then @results[3]
             when 19..24 then @results[2]
             when 25..29 then @results[1]
             when 30..32 then @results[0]
             end

    # Формируем обращение.
    appeal = name_empty? ? "" : "#{@name.capitalize}, "

    appeal += "Вы набрали #{test.positive_answers} " \
              "#{inflection(test.positive_answers, "бал", "бала", "балов")}."
    # Вывод количества набранных баллов.
    puts appeal
    # Выводим результаты теста
    puts result
  end

  # Склонятор.
  def inflection(number, krokodil, krokodila, krokodilov)
    return krokodilov if (11..14).include?(number % 100)

    case number % 10
    when 1 then krokodil
    when 2..4 then krokodila
    else krokodilov
    end
  end
end
