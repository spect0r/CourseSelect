class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|

      t.string :name
      t.string :course_code
      t.string :course_type
      t.string :teaching_type
      t.string :exam_type
      t.string :credit
      t.integer :limit_num
      t.integer :student_num, default: 0
      t.float :average, default: 0.0
      t.string :class_room
      t.string :course_time
      t.string :course_week
      t.boolean :degree_course, default: false
      
      
     t.integer :week_begin, default: 1
     t.integer :week_end, default: 20
     t.integer :time_begin, default: 1
     t.integer :time_end, default: 2
     
     t.integer :course_weekday,default: 1
     t.float :course_period, default: 40
     t.integer :course_credit, default: 40
     t.boolean :open, default: true
     t.belongs_to :teacher
     t.timestamps null: false
    end
  end
end
