class PrepareExamsController < ApplicationController
  def new

  end
  def create
    prepared_exam = PreparedExam.new(strong_params)
    prepared_exam.save!

    lesson_id = params['prepared_exam']['lesson_id']
    exam_type = params['prepared_exam']['difficulty'].to_i
    @test_sorulari = TestQuestion.where(kind: exam_type, lesson_id: lesson_id, difficulty: 0)
                          .order_by_rand
                          .limit(prepared_exam.test_kolay_soru_sayisi)
                          .all
    @test_sorulari += TestQuestion.where(kind: exam_type, lesson_id: lesson_id, difficulty: 1)
                          .order_by_rand
                          .limit(prepared_exam.test_orta_soru_sayisi)
                          .all
    @test_sorulari += TestQuestion.where(kind: exam_type, lesson_id: lesson_id, difficulty: 2)
                          .order_by_rand
                          .limit(prepared_exam.test_zor_soru_sayisi)
                          .all
    dizi = []
    @test_sorulari.each do |soru|
      dizi << soru.id
    end
    prepared_exam.test = dizi


    @classic_sorulari = ClassicQuestion.where(kind: exam_type, lesson_id: lesson_id, difficulty: 0)
                          .order_by_rand
                          .limit(prepared_exam.klasik_kolay_soru_sayisi)
                          .all
    @classic_sorulari += ClassicQuestion.where(kind: exam_type, lesson_id: lesson_id, difficulty: 1)
                          .order_by_rand
                          .limit(prepared_exam.klasik_orta_soru_sayisi)
                          .all
    @classic_sorulari += ClassicQuestion.where(kind: exam_type, lesson_id: lesson_id, difficulty: 2)
                          .order_by_rand
                          .limit(prepared_exam.klasik_zor_soru_sayisi)
                          .all
    dizi = []
    @classic_sorulari.each do |soru|
      dizi << soru.id
    end
    prepared_exam.classic = dizi
    prepared_exam.save!

    redirect_to prepare_exam_path(prepared_exam)
  end

  def show
    @exam = PreparedExam.find(params[:id])
    @sorular = []

    @exam.test.each do |e|
      @sorular << TestQuestion.find(e)
    end

    @exam.classic.each do |e|
      @sorular << ClassicQuestion.find(e)
    end
    
    render layout: false
  end
  private

  def strong_params
    params.require(:prepared_exam).permit(PreparedExam.column_names - ["created_at", "updated_at"])
  end
end
