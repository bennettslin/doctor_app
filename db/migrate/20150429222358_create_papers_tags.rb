class CreatePapersTags < ActiveRecord::Migration
  def change
    create_table :papers_tags do |t|
      t.references :paper, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
