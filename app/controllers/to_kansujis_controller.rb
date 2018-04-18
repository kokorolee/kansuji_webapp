class ToKansujisController < ApplicationController
  def index
    re = /\d/
    str = params[:input] ? params[:input] : '0'
    @input = []
    @input = @input.join("").to_i if str.scan(re) { |match| @input << match.to_s}
    @result = @input.to_kansuji
  end
end
