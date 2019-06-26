class Test
  attr_reader :positive_answers

  def initialize(path)
    @questions = File.readlines(path, encoding: "UTF-8")
    @count = 0
    @positive_answers = 0
    @reverse_questions = [4, 9, 10]
  end

  def in_progress?
    @count < @questions.size
  end

  # Проверяем ввод пользователя.
  def check_user_input
    @answer = 0
    until (1..3).include?(@answer)
      puts "Введите число и нажмите Enter:\n" \
           "1 — да\n" \
           "2 — нет\n" \
           "3 — иногда"
      @answer = STDIN.gets.to_i
    end
  end

  def counting
    # Изменяем переменную positive_answers в зависимости от ответа пользователя.
    if @answer == 3
      @positive_answers += 1
    elsif (@reverse_questions.include?(@count) && @answer == 2) ||
          (!@reverse_questions.include?(@count) && @answer == 1)
      @positive_answers += 2
    end
  end

  # Следующий вопрос.
  def following_question
    puts
    puts @questions[@count]
    check_user_input
    counting

    @count += 1
  end
end
