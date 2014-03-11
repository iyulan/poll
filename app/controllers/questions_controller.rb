class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answered = @question.has_answer_for?(request.remote_ip)
  rescue ActiveRecord::RecordNotFound
    show_404
  end

  def new
    @question = Question.new
    2.times { @question.answers << Answer.new }
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save

        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def answer
    variants = params[:question][:answers_attributes].to_hash
    answer_ids = []
    variants.each do |key,value_for_variant|
      if !value_for_variant['text'].nil?
        answer_ids << value_for_variant['id']
      end
    end

    if answer_ids != []
      answer_ids.each{|id|  UserAnswer.create(answer_id: id, user_ip: request.remote_ip) }
      redirect_to question_path(params[:id])
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :text, :many_answers, answers_attributes: [:id, :text, :_destroy])
  end
end
