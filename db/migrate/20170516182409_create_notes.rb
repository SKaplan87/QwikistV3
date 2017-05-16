class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :agreement, foreign_key: true
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
