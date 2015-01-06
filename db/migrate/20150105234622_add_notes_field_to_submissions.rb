class AddNotesFieldToSubmissions < ActiveRecord::Migration
  def change
    change_table :submissions do |t|
      t.text :notes
     end
  end
end
