class AddCreatorToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :creator, :string
  end
end
