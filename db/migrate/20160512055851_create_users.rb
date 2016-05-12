class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.boolean :is_student
      t.attachment :avatar
      
      t.timestamp
    end
  end
end
