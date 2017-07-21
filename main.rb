# encoding: utf-8 # (с) 2015 goodprogrammer.ru Курс «Настоящее программирование для всех 2» (продвинутый блок)
# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

# Используется гем транслит отсюда: https://github.com/tjbladez/translit
require 'translit'

extantion = ".jpg"

Dir.glob("*.#{extantion}") { |file|
  puts "Имя файла: #{file}"
  new_name = Translit.convert(file.downcase, :english)
  puts "На транслите: #{Translit.convert(file.downcase, :english)}"
  File.rename(file, Translit.convert(file.downcase, :english))
  puts "Файл #{file} переименован в #{new_name}"
  }
