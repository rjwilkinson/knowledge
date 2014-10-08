class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :sub_title
      t.string :content

      t.timestamps
    end
  end
end
