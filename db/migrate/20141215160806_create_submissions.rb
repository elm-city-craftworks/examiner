class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :exam_zipfile_id
      t.string :status
      t.string :code

      t.timestamps
    end
  end
end
