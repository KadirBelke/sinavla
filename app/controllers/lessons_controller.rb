class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson, only: [:update, :edit, :destroy]
  before_action :admin_mi!

  def show
    @lesson = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(strong_params)
    if @lesson.save!
      flash[:succes] = "Ders eklendi..."
      redirect_to new_lesson_path
    else
      flash[:succes] = "Ders eklenemedi..."
      render :new
    end
  end

  def edit
  end

  def update
    if @lesson.update(strong_params)
      flash[:succes] = "Ders Güncellendi..."
      redirect_to lessons_list_path
    else
      flash[:succes] = "Ders Güncellenemedi..."
      render :edit
    end
  end

  def destroy
    @lesson.delete
    redirect_to lessons_path
  end

  private
  def strong_params
    params.require("lesson").permit(:name)
  end

  def admin_mi!
    unless current_user.is_admin
        redirect_to(home_path)
        flash[:danger] = "Bu sayfaya Erişemezsin..."
    end
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
