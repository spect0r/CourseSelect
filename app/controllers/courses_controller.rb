class CoursesController < ApplicationController

  before_action :student_logged_in, only: [:select, :quit, :list, :search, :watch] #add watch
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update,:open]
  before_action :logged_in, only: :index
  
  
  
  
  

  #-------------------------for teachers----------------------

  def new
    @course=Course.new
  end
  
  # def list
  #   @course=Course.all
  #   @course=@course-current_user.courses
  #   #填入你的代码，找到已经开放的课程传给视图
  #   redirect_to courses_path, flash: {success: "已传到新界面"}
  # end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      current_user.teaching_courses<<@course
      redirect_to courses_path, flash: {success: "新课程申请成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @course=Course.find_by_id(params[:id])
  end
  
  def watch
    @course=Course.find_by_id(params[:id])
  end
  
  def choose
    @course=Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
    if @course.update_attributes(course_params)
      flash={:info => "更新成功"}
      redirect_to courses_path, flash: flash
    else
      flash={:warning => "更新失败"}
      render 'edit'
    end
    
  end

  def destroy
    @course=Course.find_by_id(params[:id])
    current_user.teaching_courses.delete(@course)
    @course.destroy
    flash={:success => "成功删除课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end
  
  def open
    @course = Course.find_by_id(params[:id])

    if @course.update_attribute("open",true)
      flash={:success => "已经成功开启该课程:#{ @course.name}"}
    else
      flash={:warning => "未成功开启该课程:#{ @course.name}"}
    end
    redirect_to courses_path, flash: flash
  end

  def close
    @course = Course.find_by_id(params[:id])

    if @course.update_attribute("open",false)
      flash={:success => "已经关闭该课程:#{ @course.name}"}
    else
      flash={:warning => "未成功关闭该课程:#{ @course.name}"}
    end
    redirect_to courses_path, flash: flash
  end
  
  def schedule
    @course=current_user.teaching_courses if teacher_logged_in?
  end
  

  #-------------------------for students----------------------

  def list

    @course=Course.find_by_sql("select * from courses where open=true")
   # @course=@course.find(:all,:conditions=>["open =  true"])
    @course=@course-current_user.courses
    
    @course.each do |course|
        if !course.open
            @course.delete(course)
        end
    end
  end

  def search
    # @course=Course.find_by_name(params[:name])
    # @course=Course.find_by_sql("select * from courses where (open=true) and (course_type=#{@coursetype})")
    # @course=Course.find :all, :conditions => ["open =  true"]
    # @course=Course.select :conditions => ["open =  true"]
    @name= params[:name]
    @coursetype= params[:coursetype]
    @course=Course.all
    # @searchcourses=@course.find_all{|n| ((@name.empty?) || (n.name == @name)) &&((@coursetype.empty?) || (n.course_type == @coursetype)) }
    @searchcourses=@course.find_by_sql("select * from courses where name like '%"+@name+"%' and course_type='"+@coursetype+ "'")

    # @searchcourses=@course.find_all{|n| (n.course_type == @coursetype)}
    # @course.each do |course|
    #   if (course.course_type == @coursetype )
    #     @searchcourses<<course
    #   end
    #   @searchcourses<<course
    # end
    @course=@searchcourses
  end

  def select
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    flash={:success => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    current_user.courses.delete(@course)
    
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end


  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
  end


  private

  # Confirms a student logged-in user.
  def student_logged_in
    unless student_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a  logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :name, :course_type, :teaching_type, :exam_type,
                                  :limit_num, :class_room,  :course_weekday, :week_begin, :week_end, :time_begin, :time_end, :course_credit, :course_period)
  end
#:course_time, :course_week, 

end
