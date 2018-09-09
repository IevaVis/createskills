class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :teacher_name
      t.string :teacher_country
      t.string :email
      t.string :password_digest
      t.string :area_field
      t.string :grade_of_teaching

      t.timestamps
    end
  end
end
