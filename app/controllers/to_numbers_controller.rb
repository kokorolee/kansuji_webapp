class ToNumbersController < ApplicationController

  def index
    re = /零|一|二|三|四|五|六|七|八|九|十|百|千|万|万|億|兆|京|垓|𥝱|穣|溝|澗|正|載|極|恒河沙|阿僧祇|那由他|不可思議|無量大数/i
    str = params[:input] ? params[:input] : '零'
    @input = []
    @input = @input.join("") if str.scan(re) { |match| @input << match.to_s}

    puts "input #{@input} ======="
    @result = @input.to_number
  end
end
