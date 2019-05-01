class TestsController < ApplicationController
  def new
    @question = TestQuestion.new
    @lessons  = Lesson.all
  end

  def create
    @question = TestQuestion.new(strong_params)
    @question.user = current_user
    if @question.save!
      flash[:succes] = "Soru Eklendi..."
      redirect_to new_test_path
    else
      flash[:succes] = "Soru Eklenemedi..."
      render :new
    end
  end

  def edit
    @question = TestQuestion.find(params[:id])
    @lessons = Lesson.all
  end

  def update
    @question = TestQuestion.find(params[:id])
    if @question.update(strong_params)
      flash[:succes] = "Soru Güncelledi..."
      redirect_to questions_path
    else
      flash[:succes] = "Soru Güncellenemedi..."
      render :edit
    end
  end

  private
  def strong_params
    params.require("test_question").permit(:question, :true_answer, :wrong, :wrong2, :wrong3, :wrong4, :kind, :difficulty, :lesson_id)
  end
end
