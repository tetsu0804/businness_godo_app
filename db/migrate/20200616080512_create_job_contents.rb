class CreateJobContents < ActiveRecord::Migration[5.1]
  def change
    create_table :job_contents do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :start_time, null: false
      t.integer :price, null: false
      t.string :work_address, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
