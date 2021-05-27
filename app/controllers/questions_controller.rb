class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:role,:mapping)
  end

  def import
    ImportQuestions.new(params[:file]).import #service to import data
    redirect_to root_url, notice: "Questions imported."
  end
end
