class QuizzesController < ApplicationController
  def create
    @quiz = Quiz.new
  end
end
