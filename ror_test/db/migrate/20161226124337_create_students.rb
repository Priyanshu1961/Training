class CreateStudents < ActiveRecord::Migration[5.0]
    def change
        change_table :students do |_t|
          add_foreign_key :students, :colleges, column: :college_name, primary_key: :name
        end
    end
end
