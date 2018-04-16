require 'rails_helper'
require 'kansuji'

describe 'Kansuji' do
  context '10 ** 1 ' do
    it '0' do
      '0'.to_kansuji.should == '零'
      # '一'.to_number.should == '1'
    end
    it '1' do
      '1'.to_kansuji.should == '一'
      # '一'.to_number.should == '1'
    end
    it '01' do
      '01'.to_kansuji.should == '一'
    end
    it '10' do
      '10'.to_kansuji.should == '十'
      # '十'.to_number.should == '10'
    end
    it '11' do
      '11'.to_kansuji.should == '十一'
      # '十一'.to_kansuji.should == '11'
    end
    it '23' do
      '23'.to_kansuji.should == '二十三'
      # '二十三'.to_kansuji.should == '23'
    end
  end
  context '10 ** 2 ' do
    it '010' do
      '010'.to_kansuji.should == '十'
    end
    it '100' do
      '100'.to_kansuji.should == '百'
    end
    it '101' do
      '101'.to_kansuji.should == '百一'
    end
    it '234' do
      '234'.to_kansuji.should == '二百三十四'
    end
  end
  context '10 ** 3 ' do
    it '1000' do
      '1000'.to_kansuji.should == '千'
    end
    it '1001' do
      '1001'.to_kansuji.should == '千一'
    end
    it '1234' do
      '1234'.to_kansuji.should == '千二百三十四'
    end
  end
  context '10 ** 4 ' do
    it '10000' do
      '10000'.to_kansuji.should == '一万'
    end
    it '10001' do
      '10001'.to_kansuji.should == '一万一'
    end
    it '51234' do
      '51234'.to_kansuji.should == '五万千二百三十四'
    end
  end
  context '10 ** 5 ' do
    it '100000' do
      '100000'.to_kansuji.should == '十万'
    end
    it '100001' do
      '100001'.to_kansuji.should == '十万一'
    end
    it '651234' do
      '651234'.to_kansuji.should == '六十五万千二百三十四'
    end
  end
  context '10 ** 6 ' do
    it '1000000' do
      '1000000'.to_kansuji.should == '百万'
    end
    it '01000000' do
      '01000000'.to_kansuji.should == '百万'
    end
    it '1000001' do
      '1000001'.to_kansuji.should == '百万一'
    end
    it '7651234' do
      '7651234'.to_kansuji.should == '七百六十五万千二百三十四'
    end
  end
  context '10 ** 7 ' do
    it '10000000' do
      '10000000'.to_kansuji.should == '千万'
    end
    it '010000000' do
      '010000000'.to_kansuji.should == '千万'
    end
    it '10000001' do
      '10000001'.to_kansuji.should == '千万一'
    end
    it '87651234' do
      '87651234'.to_kansuji.should == '八千七百六十五万千二百三十四'
    end
  end
  context '10 ** 8 ' do
    it '100000000' do
      '100000000'.to_kansuji.should == '一億'
    end
    it '0100000000' do
      '0100000000'.to_kansuji.should == '一億'
    end
    it '100000001' do
      '100000001'.to_kansuji.should == '一億一'
    end
    it '987651234' do
      '987651234'.to_kansuji.should == '九億八千七百六十五万千二百三十四'
    end
  end
  context '10 ** 9 ' do
    it '1000000000' do
      '1000000000'.to_kansuji.should == '十億'
    end
    it '01000000000' do
      '01000000000'.to_kansuji.should == '十億'
    end
    it '1000000001' do
      '1000000001'.to_kansuji.should == '十億一'
    end
    it '1987651234' do
      '1987651234'.to_kansuji.should == '十九億八千七百六十五万千二百三十四'
    end
  end
  context '10 ** 10 ' do
    it '10000000000' do
      '10000000000'.to_kansuji.should == '百億'
    end
    it '010000000000' do
      '010000000000'.to_kansuji.should == '百億'
    end
    it '10000000001' do
      '10000000001'.to_kansuji.should == '百億一'
    end
    it '10987651234' do
      '10987651234'.to_kansuji.should == '百九億八千七百六十五万千二百三十四'
    end
  end
  context '10 ** 11 ' do
    it '100000000000' do
      '100000000000'.to_kansuji.should == '千億'
    end
    it '0100000000000' do
      '0100000000000'.to_kansuji.should == '千億'
    end
    it '100000000001' do
      '100000000001'.to_kansuji.should == '千億一'
    end
    it '109876512340' do
      '109876512340'.to_kansuji.should == '千九十八億七千六百五十一万二千三百四十'
    end
  end
  context '10 ** 12 ' do
    it '1000000000000' do
      '1000000000000'.to_kansuji.should == '一兆'
    end
    it '01000000000000' do
      '01000000000000'.to_kansuji.should == '一兆'
    end
    it '1000000000001' do
      '1000000000001'.to_kansuji.should == '一兆一'
    end
    it '1200000000001' do
      '1200000000001'.to_kansuji.should == '一兆二千億一'
    end
    it '1098706512340' do
      '1098706512340'.to_kansuji.should == '一兆九百八十七億六百五十一万二千三百四十'
    end
  end
  context '10 ** 13 ' do
    it '10000000000000' do
      '10000000000000'.to_kansuji.should == '十兆'
    end
    it '010000000000000' do
      '010000000000000'.to_kansuji.should == '十兆'
    end
    it '10000000000001' do
      '10000000000001'.to_kansuji.should == '十兆一'
    end
    it '10985706512340' do
      '10985706512340'.to_kansuji.should == '十兆九千八百五十七億六百五十一万二千三百四十'
    end
  end
  context '10 ** 14 ' do
    it '100000000000000' do
      '100000000000000'.to_kansuji.should == '百兆'
    end
    it '0100000000000000' do
      '0100000000000000'.to_kansuji.should == '百兆'
    end
    it '100000000000001' do
      '100000000000001'.to_kansuji.should == '百兆一'
    end
    it '109857806512340' do
      '109857806512340'.to_kansuji.should == '百九兆八千五百七十八億六百五十一万二千三百四十'
    end
  end
  context '10 ** 15 ' do
    it '1000000000000000' do
      '1000000000000000'.to_kansuji.should == '千兆'
    end
    it '01000000000000000' do
      '01000000000000000'.to_kansuji.should == '千兆'
    end
    it '1000000000000001' do
      '1000000000000001'.to_kansuji.should == '千兆一'
    end
    it '9000000003000001' do
      '9000000003000001'.to_kansuji.should == '九千兆三百万一'
    end
    it '1098578069512340' do
      '1098578069512340'.to_kansuji.should == '千九十八兆五千七百八十億六千九百五十一万二千三百四十'
    end
  end
  context '10 ** 16 ' do
    it '10000000000000000' do
      '10000000000000000'.to_kansuji.should == '一京'
    end
    it '010000000000000000' do
      '010000000000000000'.to_kansuji.should == '一京'
    end
    it '10000000000000001' do
      '10000000000000001'.to_kansuji.should == '一京一'
    end
    it '10985780695123040' do
      '10985780695123040'.to_kansuji.should == '一京九百八十五兆七千八百六億九千五百十二万三千四十'
    end
  end
  context '10 ** 17 ' do
    it '100000000000000000' do
      '100000000000000000'.to_kansuji.should == '十京'
    end
    it '0100000000000000000' do
      '0100000000000000000'.to_kansuji.should == '十京'
    end
    it '100000000000000001' do
      '100000000000000001'.to_kansuji.should == '十京一'
    end
    it '109857806951230409' do
      '109857806951230409'.to_kansuji.should == '十京九千八百五十七兆八千六十九億五千百二十三万四百九'
    end
  end
  context '10 ** 18 ' do
    it '1000000000000000000' do
      '1000000000000000000'.to_kansuji.should == '百京'
    end
    it '01000000000000000000' do
      '01000000000000000000'.to_kansuji.should == '百京'
    end
    it '1000000000000000001' do
      '1000000000000000001'.to_kansuji.should == '百京一'
    end
    it '1092857806951230409' do
      '1092857806951230409'.to_kansuji.should == '百九京二千八百五十七兆八千六十九億五千百二十三万四百九'
    end
  end
  context '10 ** 19 ' do
    it '10000000000000000000' do
      '10000000000000000000'.to_kansuji.should == '千京'
    end
    it '010000000000000000000' do
      '010000000000000000000'.to_kansuji.should == '千京'
    end
    it '10000000000000000001' do
      '10000000000000000001'.to_kansuji.should == '千京一'
    end
    it '10925857806951230409' do
      '10925857806951230409'.to_kansuji.should == '千九十二京五千八百五十七兆八千六十九億五千百二十三万四百九'
    end
  end
  context '10 ** 20 ' do
    it '100000000000000000000' do
      '100000000000000000000'.to_kansuji.should == '一垓'
    end
    it '0100000000000000000000' do
      '0100000000000000000000'.to_kansuji.should == '一垓'
    end
    it '100000000000000000001' do
      '100000000000000000001'.to_kansuji.should == '一垓一'
    end
    it '100000000000008000001' do
      '100000000000008000001'.to_kansuji.should == '一垓八百万一'
    end
    it '109258578069512304095' do
      '109258578069512304095'.to_kansuji.should == '一垓九百二十五京八千五百七十八兆六百九十五億千二百三十万四千九十五'
    end
  end
  context '10 ** 21 ' do
    it '1000000000000000000000' do
      '1000000000000000000000'.to_kansuji.should == '十垓'
    end
    it '01000000000000000000000' do
      '01000000000000000000000'.to_kansuji.should == '十垓'
    end
    it '1000000000000000000001' do
      '1000000000000000000001'.to_kansuji.should == '十垓一'
    end
    it '1092585780695123040956' do
      '1092585780695123040956'.to_kansuji.should == '十垓九千二百五十八京五千七百八十兆六千九百五十一億二千三百四万九百五十六'
    end
  end
  context '10 ** 22 ' do
    it '10000000000000000000000' do
      '10000000000000000000000'.to_kansuji.should == '百垓'
    end
    it '010000000000000000000000' do
      '010000000000000000000000'.to_kansuji.should == '百垓'
    end
    it '10000000000000000000001' do
      '10000000000000000000001'.to_kansuji.should == '百垓一'
    end
    it '10925857806951230409546' do
      '10925857806951230409546'.to_kansuji.should == '百九垓二千五百八十五京七千八百六兆九千五百十二億三千四十万九千五百四十六'
    end
  end
  context '10 ** 23 ' do
    it '100000000000000000000000' do
      '100000000000000000000000'.to_kansuji.should == '千垓'
    end
    it '0100000000000000000000000' do
      '0100000000000000000000000'.to_kansuji.should == '千垓'
    end
    it '100000000000000000000001' do
      '100000000000000000000001'.to_kansuji.should == '千垓一'
    end
    it '50925857806951230409546' do
      '50925857806951230409546'.to_kansuji.should == '五百九垓二千五百八十五京七千八百六兆九千五百十二億三千四十万九千五百四十六'
    end
  end
  context '10 ** 24 ' do
    it '1000000000000000000000000' do
      '1000000000000000000000000'.to_kansuji.should == '一𥝱'
    end
    it '01000000000000000000000000' do
      '01000000000000000000000000'.to_kansuji.should == '一𥝱'
    end
    it '1000000000000000000000001' do
      '1000000000000000000000001'.to_kansuji.should == '一𥝱一'
    end
    it '1000000000000100000001001' do
      '1000000000000100000001001'.to_kansuji.should == '一𥝱千億千一'
    end
    it '4000006000000000000000000' do
      '4000006000000000000000000'.to_kansuji.should == '四𥝱六百京'
    end
    it '5095857806951230410954699' do
      '5095857806951230410954699'.to_kansuji.should == '五𥝱九百五十八垓五千七百八十京六千九百五十一兆二千三百四億千九十五万四千六百九十九'
    end
  end
end
