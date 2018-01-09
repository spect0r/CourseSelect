class Course < ActiveRecord::Base

  has_many :grades
  has_many :users, through: :grades

  belongs_to :teacher, class_name: "User"

  validates :name, :course_time, :course_week,
            :class_room, :credit,:course_weekday, :week_begin, :week_end, :time_begin, :time_end,  :course_credit, :course_period,
            presence: true, length: {maximum: 50}
  Teachingtype=["课堂讲授为主","授课、讨论"]
  # validates :teaching_type,:inclusion=>Teachingtype,presence: true
  Coursetype=["一级学科核心课", "一级学科普及课", "公共选修课", "专业普及课", "专业研讨课", "专业核心课", "公共必修课", "公共选修课"]
  validates :course_type,:inclusion=>Coursetype,presence: true
  Examtype=["课堂开卷", "闭卷笔试", "读书报告", "课上讨论","大作业","其他"]
  validates :exam_type,:inclusion =>Examtype,presence: true
             
end
          
