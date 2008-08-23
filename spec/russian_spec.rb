require File.dirname(__FILE__) + '/spec_helper'

describe String, 'transliterate' do
  it "should transliterate lower case letters" do
    'а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я'.transliterate.should ==
    'a b v g d e yo zh z i y k l m n o p r s t u f kh ts ch sh shch \' y \' e yu ya'
  end

  it "should transliterate upper case letters" do
    'А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я'.transliterate.should ==
    'A B V G D E YO ZH Z I Y K L M N O P R S T U F KH TS CH SH SHCH \' Y \' E YU YA'
  end

  it "should transliterate all lower case" do
    'целая куча букв'.transliterate.should == 'tselaya kucha bukv'
  end

  it "should transliterate all upper case" do
    'ЦЕЛАЯ КУЧА БУКВ'.transliterate.should == 'TSELAYA KUCHA BUKV'
  end
  
  it "should transliterate capitalized" do
    'Целая Куча Букв'.transliterate.should == 'Tselaya Kucha Bukv'
  end
  
  it "should transliterate mixed cases" do
    'цЕлАя кУчА БуКв'.transliterate.should == 'tsElAya kUchA BuKv'
  end

  it "should transliterate mixed language" do
    'tsЕлАя kУчA BуKв'.transliterate.should == 'tsElAya kUchA BuKv'
  end
end

describe String, 'to_string_for_url' do
  it "should make good string for url" do
    ''.to_string_for_url.should == ''
    'целая куча букв'.to_string_for_url.should == 'tselaya-kucha-bukv'
    'ЦЕЛАЯ КУЧА БУКВ'.to_string_for_url.should == 'tselaya-kucha-bukv'
    'слово - целая куча букв'.to_string_for_url.should == 'slovo-tselaya-kucha-bukv'
    'куча !"№%:,.;()_+ символов'.to_string_for_url.should == 'kucha-_-simvolov'
  end
end
