class ToKansujisController < ApplicationController
  def index
    @input = params[:input].to_i
    @exp = "___#{'%e' %@input}"
    @result = @input.to_kansuji
    puts @input
    puts NUMS_HASH
  end
end
