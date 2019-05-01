class HomeController < ApplicationController
  def index

  end
  def show
    @test_questions = TestQuestion.where(user_id: current_user.id)
    @classic_questions = ClassicQuestion.where(user_id: current_user.id)
  end
end
