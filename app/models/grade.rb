class Grade < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates  :grade_h, numericality: {only_integer: true,greater_than_or_equal_to:0,less_than_or_equal_to:100,
  message: " 平时成绩 is not a valid grade,please input 平时成绩>=0&&<=100" }
  validates  :grade_e, numericality: {only_integer: true,greater_than_or_equal_to:0,less_than_or_equal_to:100,
  message: " 考试成绩 is not a valid grade,please input 考试成绩>=0&&<=100" }
  validates  :grade_hp,  numericality: {only_integer: true,greater_than_or_equal_to:0,less_than_or_equal_to:100,
  message: " 所占比重is not a valid percent,please input percent>=0&&<=100" }
  validate   :percent_equal_to_100 
  
  def percent_equal_to_100
    if(grade_ep+grade_hp)!=100
    errors.add(:grade_ep, "所占比重之和必须为100")
    end
  end


end


