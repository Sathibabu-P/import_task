class Api::V1::QuestionsController < ApplicationController
 before_action :set_pagination , only: :index

  def index
    questions = Question.includes(:role,:mapping)
    @questions = get_byorder(questions).limit(@limit).offset(@offset)
    render json: { data: { questions: @questions, total_questions: questions.count } }
  end

  private

  def set_pagination
    offset  =  params[:offset]&.to_i || 0
    @offset =  offset * 10
    @limit  =  params[:limit]&.to_i || 10
  end


  def get_byorder(questions) 
    questions = if params[:key].match(/_id/)
      klass = params[:key].split("_").first.pluralize
      order = "#{klass}.title asc" #sort the data by association also
      questions.order_by_assoc(order)
    else
      questions.order_by(params[:key])
    end
    questions
  end
end
