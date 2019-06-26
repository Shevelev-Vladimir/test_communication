# encoding: utf-8

# Константа с номером версии программы.
VERSION = 5

# Подключаем файлы из папки lib.
require_relative "./lib/test"
require_relative "./lib/inference"

# Объявляем эксемпляр класса Test.
test = Test.new
inference = Inference.new(ARGV[0])

# Печатаем версию программы.
inference.print_version(VERSION)
# Здорованмся с пользователем.
inference.say_hi

# До тех пока тест запущен, выводим следующий вопрос.
while test.in_progress?
  test.following_question
end

# Вывод результата игры.
inference.print_result(test)
