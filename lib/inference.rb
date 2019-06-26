class Inference
  def initialize(name)
    @name = name
    # Массив результатов
    @results = [
      # 3 очка и менее.
      'Ваша коммуникабельность носит болезненный характер. ' \
        'Вы говорливы, многословны, вмешиваетесь в дела, которые не имеют к Вам ' \
        'никакого отношения. Беретесь судить о проблемах, в которых совершенно ' \
        'не компетентны. Вольно или невольно Вы часто бываете причиной разного ' \
        'рода конфликтов в Вашем окружении. Вспыльчивы, обидчивы, нередко ' \
        'бываете необъективны. Серьезная работа не для Вас. Людям – и на работе, ' \
        'и дома, и вообще повсюду – трудно с Вами. Да, Вам надо поработать ' \
        'над собой и своим характером! Прежде всего воспитывайте в себе ' \
        'терпеливость и сдержанность, уважительно относитесь к людям, наконец, ' \
        'подумайте о своем здоровье – такой стиль жизни не проходит бесследно.',
      # 4-8 очков.
      'Вы, должно быть, «рубаха-парень». Общительность бьет из Вас ' \
        'ключом. Вы всегда в курсе всех дел. Вы любите принимать участие во всех ' \
        'дискуссиях, хотя серьезные темы могут вызвать у Вас мигрень или даже ' \
        'хандру. Охотно берете слово по любому вопросу, даже если имеете о нем ' \
        'поверхностное представление. Всюду чувствуете себя в своей тарелке. ' \
        'Беретесь за любое дело, хотя не всегда можете успешно довести ' \
        'его до конца. По этой самой причине руководители и коллеги относятся ' \
        'к Вам с некоторой опаской и сомнениями. Задумайтесь над этими фактами.',
      # 9-13 очков.
      'Вы весьма общительны (порой, быть может, даже сверх меры). ' \
        'Любопытны, разговорчивы, любите высказываться по разным вопросам, что, ' \
        'бывает, вызывает раздражение окружающих. Охотно знакомитесь с новыми ' \
        'людьми. Любите бывать в центре внимания, никому не отказываете в ' \
        'просьбах, хотя не всегда можете их выполнить. Бывает, вспылите, ' \
        'но быстро отходите. Чего Вам недостает, так это усидчивости, терпения ' \
        'и отваги при столкновении с серьезными проблемами. При желании, однако, ' \
        'Вы можете себя заставить не отступать.',
      # 14-18 очков.
      'У вас нормальная коммуникабельность. Вы любознательны, ' \
        'охотно слушаете интересного собеседника, достаточно терпеливы в общении, ' \
        'отстаиваете свою точку зрения без вспыльчивости. Без неприятных ' \
        'переживаний идете на встречу с новыми людьми. В то же время не любите ' \
        'шумных компаний; экстравагантные выходки и многословие вызывают у Вас ' \
        'раздражение.',
      # 19-24 очков.
      'Вы в известной степени общительны и в незнакомой ' \
        'обстановке чувствуете себя вполне уверенно. Новые проблемы ' \
        'Вас не пугают. И все же с новыми людьми сходитесь с оглядкой, ' \
        'в спорах и диспутах участвуете неохотно. В Ваших высказываниях порой ' \
        'слишком много сарказма, без всякого на то основания. Эти недостатки ' \
        'исправимы.',
      # 25-29 очков.
      'Вы замкнуты, неразговорчивы, предпочитаете одиночество, ' \
        'поэтому у Вас мало друзей. Новая работа и необходимость новых ' \
        'контактов если и не ввергают Вас в панику, то надолго ' \
        'выводят из равновесия. Вы знаете эту особенность своего характера ' \
        'и бываете недовольны собой. Но не ограничивайтесь только таким ' \
        'недовольством – в Вашей власти переломить эти особенности характера. ' \
        'Разве не бывает, что при какой-либо сильной увлеченности Вы приобретаете ' \
        'вдруг полную коммуникабельность? Стоит только встряхнуться.',
      # 30-32 очка.
      'Вы явно не коммуникабельны, и это Ваша беда, так как больше ' \
        'всего страдаете от этого Вы сами. Но и близким Вам людям нелегко. ' \
        'На Вас трудно положиться в деле, которое требует групповых усилий. ' \
        'Старайтесь быть общительнее, контролируйте себя.'
    ]
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

  #
  def name_empty?
    @name == "" || @name == nil
  end

  #
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
             when 0..3 then results[0]
             when 4..8 then results[1]
             when 9..13 then results[2]
             when 14..18 then results[3]
             when 19..24 then results[4]
             when 25..29 then results[5]
             when 30..32 then results[6]
             end
    # 
    appeal = name_empty? ? "" : "#{@name.capitalize}, "

    appeal += "Вы набрали #{test.positive_answers} " \
              "#{inflection(test.positive_answers, "бал", "бала", "балов")}."
    # 
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