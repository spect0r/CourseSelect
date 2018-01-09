class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
      t.integer :grade
      t.integer :grade_h, default: 0
      t.integer :grade_e, default: 0
      t.integer :grade_ep, default: 100
      t.integer :grade_hp, default: 0
      t.timestamps null: false
    end
  end
end
