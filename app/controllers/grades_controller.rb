class GradesController < ApplicationController

  before_action :teacher_logged_in, only: [:index,:update,:edit]

  def edit
    @grade=Grade.find_by_id(params[:id])
  end
  
  def update
    @grade=Grade.find_by_id(params[:id])
    if @grade.update_attributes(grade_params)&&@grade.update_attributes!(:grade => (params[:grade][:grade_h].to_f*
      params[:grade][:grade_hp].to_f/100.0).round.to_i+(params[:grade][:grade_e].to_f*params[:grade][:grade_ep].to_f/100.0).round.to_i)
      flash={:success => "#{@grade.user.name} #{@grade.course.name}的成绩已成功修改为 #{@grade.grade}"}
      redirect_to grades_path(course_id: params[:course_id]), flash: flash
    else
      flash={:danger => "修改成绩失败.请检查"}
      render 'edit'
      #redirect_to grades_path(course_id: params[:course_id]), flash: flash
    end

  end

  def index
    if teacher_logged_in?
      @course=Course.find_by_id(params[:course_id])
      @grades=@course.grades
      @grades.each do |grade|
      grade.course.average=grade.course.average+(grade.grade).to_f/(grade.course.users.length).to_f
      grade.course.average=grade.course.average.round(2)
      end
     
    elsif student_logged_in?
      @grades=current_user.grades
    else
      redirect_to root_path, flash: {:warning=>"请先登陆"}
    end
  end


  private

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

end

  def grade_params
    params.require(:grade).permit(:grade_h, :grade_hp, :grade_e, :grade_ep)
  end