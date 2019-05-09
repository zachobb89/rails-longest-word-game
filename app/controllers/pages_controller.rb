# frozen_string_literal: true

require 'open-uri'

class PagesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'...'Z').to_a.sample
    end
  end

  def score
    @letters = params[:letters].split(' ')
    @word = params[:word]
    @check = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@word}").read)
    if @check['found']
      if check_grid(@letters, @word)
        return @score = "Congratulations, your score is #{@check['length'].to_i} points."
      else
        @score = 'Sorry, this is not in the grid.'
      end
    else
      return @score = 'Sorry, this is not an english word.'
    end
  end

  private

  def check_grid(letters, user_word)
    attempt_letters = user_word.upcase.split('')
    attempt_letters.each do |letter|
      i = letters.index(letter)
      if i.nil?
        return false
      else
        letters.delete_at(i)
      end
    end
    true
  end
end
