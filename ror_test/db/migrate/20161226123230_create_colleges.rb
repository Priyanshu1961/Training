class CreateColleges < ActiveRecord::Migration[5.0]

  def change
    create_table :colleges, :primary_key => :name, :id =>false do |t|
       t.string :name
       t.integer :extended_year
    end
  end
end
