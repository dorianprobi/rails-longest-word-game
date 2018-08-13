    require 'json'
    require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = []
    (0..10).map do @letters << ('a'..'z').to_a.shuffle.first end
  end

  def score
    @input = params[:word].split('')
    @score = 100
    check = false
    @letters = params[:array].split(' ')

    @input.each do |i|

      if @letters.include? i
        check = true
        @letters.delete(i)
      else
        @answer = "Just use the given letters!!"
        check = false
      end
    end
    if check === true
      @input = @input.join.to_s
      url = "https://wagon-dictionary.herokuapp.com/#{@input}"
      user_serialized = open(url).read
      user = JSON.parse(user_serialized)

      @show = "#{user['found']}"
      if user['found'] === true
        @answer = "Your word #{@input} exists !! "
      else
        @answer = "Your word #{@input} does not exist !!"
      end
    else
    end
  end
end
