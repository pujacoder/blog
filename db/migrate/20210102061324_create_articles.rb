class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :creator
      t.integer :user_id
      t.string :title
      t.text :body


      t.timestamps
    end
  end
end
#rails generate migration add_creator_to_articles creator:string