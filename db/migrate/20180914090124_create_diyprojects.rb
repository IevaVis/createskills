class CreateDiyprojects < ActiveRecord::Migration[5.2]
  def change
    create_table :diyprojects do |t|
    	t.string :title
    	t.text :description
    	t.belongs_to :parent, index: true
    	t.timestamps
    end
  end
end
