class ClassicQuestionsController < ApplicationController
  before_action :set_classsic_question, only: [:update, :edit, :destroy]
  before_action :authenticate_user!
  def new
    @question = ClassicQuestion.new
    @lessons  = Lesson.all
  end

  def create
    @question = ClassicQuestion.new(strong_params)
    @question.user = current_user
    if @question.save!
      flash[:succes] = "Soru Eklendi..."
      redirect_to new_classic_question_path
    else
      flash[:succes] = "Soru Eklenemedi..."
      render :new
    end
  end

  def edit
    @lessons = Lesson.all
  end

  def update
    if @question.update(strong_params)
      flash[:succes] = "Soru Güncelledi..."
      redirect_to questions_path
    else
      flash[:succes] = "Soru Güncellenemedi..."
      render :edit
    end
  end

  def destroy
    @question.delete
    redirect_to questions_path
  end

  private
  def strong_params
    params.require("classic_question").permit(:question, :true_answer, :kind, :difficulty, :lesson_id)
  end

  def set_classsic_question
    @question = ClassicQuestion.find(params[:id])
  end
end
