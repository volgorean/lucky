class CreateModels < ActiveRecord::Migration[5.2]
  def change
  	create_table :collections do |t|
  		t.string :title
  		t.text :description
      t.string :release

  		t.timestamps
    end

    create_table :videos do |t|
    	t.string :title
    	t.text :description

    	t.integer :collection_id
    	t.integer :season_id
    	t.integer :season_pos
    	t.integer :runtime_s
    	t.string :release

    	t.timestamps
    end
  end
end
