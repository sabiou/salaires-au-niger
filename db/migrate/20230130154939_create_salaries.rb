class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.string :title
      t.string :company
      t.string :city
      t.string :seniority
      t.integer :salary

      t.timestamps
    end
  end
end
