class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end
  def new
    @skill = Skill.new
  end

  def create
    @skill = current_user.skills.new(skill_params)
    if @skill.save
      flash[:success] = "Skill added"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @skill = current_user.skills.find_by(id: params[:id])
  end

  def update
    @skill = current_user.skills.find_by(id: params[:id])
    if @skill.update_attributes(skill_params)
      flash[:success] = "Skill updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @skill = current_user.skills.find_by(id: params[:id])
    @skill.destroy
    flash[:success] = "Skill deleted"
    redirect_to current_user
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :rating, :user_id)
  end
end
