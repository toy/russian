# encoding: utf-8
class String
  TRANSLITERATE_TABLE = Hash[
    *(
      %w(а б в г д е ё  ж  з и й к л м н о п р с т у ф х  ц  ч  ш  щ    ъ ы ь э ю  я ).zip(
      %w(a b v g d e yo zh z i y k l m n o p r s t u f kh ts ch sh shch ' y ' e yu ya))
    ).flatten
  ]

  def transliterate
    gsub(/\w+/) do |word|
      mb_word = word.mb_chars
      mb_word_tr = mb_word.split(//).collect do |c|
        TRANSLITERATE_TABLE[c.downcase.to_s] || c
      end.join
      
      case mb_word
        when mb_word.upcase
          mb_word_tr.upcase
        when mb_word.downcase
          mb_word_tr.downcase
        when mb_word.capitalize
          mb_word_tr.capitalize
        else
          mb_word.split(//).collect do |c|
            tc = TRANSLITERATE_TABLE[c.downcase.to_s]
            (tc && c.upcase != c.downcase) ? (c == c.upcase ? tc.upcase : tc.downcase) : c
          end.join
      end
    end
  end

  def for_url
    mb_chars.downcase.to_s.
    transliterate.strip.
    gsub(/\s/, '-').
    gsub(/-{2,}/, '-').
    gsub(/[^a-z0-9'_\-]/, '')
  end
end
