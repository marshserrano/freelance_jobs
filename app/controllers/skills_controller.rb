class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end
  def new
    @skill = Skill.new
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :rating, :user_id)
  end
end
