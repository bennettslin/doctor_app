class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
