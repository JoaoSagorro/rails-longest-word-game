require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
    # @letters = Array.new(5) { VOWELS.sample }
    # @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    # @letters
  end

  def score
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)
    @user_input = params[:word]
    if @user_input.chars.all? { |letter| @user_input.count(letter) > @letters.count(letter) }
      @response = "dumbass"
    elsif params[:found]
      @response = "dumbass 2x"
    else "dumbass 3x"
    end
    # @letters.each do |letter|
    #   if params[:word].include?(letter) && word[:found]
    #     @result = params[:word]
    #   else "Nope"
    #   end
    # end
    # if word[:found]
    #   @result = params[:word]
    # else @result = params[:word] + " you're dumb"
    # end
  end
end
