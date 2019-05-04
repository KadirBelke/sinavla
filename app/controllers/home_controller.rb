class HomeController < ApplicationController
  before_action :authenticate_user!
  def show
    @test_questions = TestQuestion.where(user_id: current_user.id)
    @classic_questions = ClassicQuestion.where(user_id: current_user.id)
  end
end
