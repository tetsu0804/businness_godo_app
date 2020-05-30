class CreateWorkBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :work_books do |t|
      t.boolean :paid, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
