class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ApplicationHelper
  def create

    question = Question.create(
      body: params[:question][:body],
      user_id: params[:question][:user_id]
      )

    redirect_to "/questions", notice: "Вопрос добавлен успешно"
  end


  def update
    @question = Question.find(params[:id])
    @question.update(
      body: params[:question][:body],
      user_id: params[:question][:user_id]
    )

    redirect_to question_path(@question)

  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @questions = Question.all

  end

  def edit
    @question = Question.find(params[:id])
  end

  def main
    @img = inclination('https://dog.ceo/api/breeds/image/random')
  end



end
