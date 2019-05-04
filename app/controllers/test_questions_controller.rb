class TestQuestionsController < ApplicationController
  before_action :set_test_question, only: [:update, :edit, :destroy]
  before_action :authenticate_user!
  def new
    @question = TestQuestion.new
    @lessons  = Lesson.all
  end

  def create
    @question = TestQuestion.new(strong_params)
    @question.user = current_user

    if @question.save!
      flash[:succes] = "Soru Eklendi..."
      redirect_to new_test_question_path
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
    params.require("test_question").permit(:question, :true_answer, :wrong, :wrong2, :wrong3, :wrong4, :kind, :difficulty, :lesson_id, :image)
  end

  def set_test_question
    @question = TestQuestion.find(params[:id])
  end
end
