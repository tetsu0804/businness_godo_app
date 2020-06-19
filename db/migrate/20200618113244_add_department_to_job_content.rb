class AddDepartmentToJobContent < ActiveRecord::Migration[5.1]
  def change
    add_reference :job_contents, :department, foreign_key: true
  end
end
