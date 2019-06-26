# encoding: utf-8

# Константа с номером версии программы.
VERSION = 5

# Подключаем файлы из папки lib.
require_relative 'lib/test'
require_relative 'lib/inference'

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

begin
  # Объявляем экземпляр класса Test.
  test = Test.new(questions_path)
  inference = Inference.new(ARGV[0], results_path)

  # Печатаем версию программы.
  inference.print_version(VERSION)
  # Здороваемся с пользователем.
  inference.say_hi

  # До тех пока тест запущен, выводим следующий вопрос.
  while test.in_progress?
    test.following_question
  end

  # Вывод результата игры.
  inference.print_result(test)

rescue SystemCallError => error
  puts "Не найден файл: " + error.message
rescue Interrupt
  puts "\nВы вышли из игры."
# rescue
  puts "Что-то пошло не так..."
end
