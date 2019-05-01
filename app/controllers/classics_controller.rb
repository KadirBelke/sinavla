class ClassicsController < ApplicationController
  def new
    @question = ClassicQuestion.new
    @lessons  = Lesson.all
  end

  def create
    @question = ClassicQuestion.new(strong_params)
    @question.user = current_user
    puts current_user.to_s
    if @question.save!
      flash[:succes] = "Soru Eklendi..."
      redirect_to new_classic_path
    else
      flash[:succes] = "Soru Eklenemedi..."
      render :new
    end
  end

  private
  def strong_params
    params.require("classic_question").permit(:question, :true_answer, :kind, :difficulty, :lesson_id)
  end
end
