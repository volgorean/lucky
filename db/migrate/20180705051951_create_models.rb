class CreateModels < ActiveRecord::Migration[5.2]
  def change
  	create_table :collections do |t|
  		t.string :title
  		t.text :description

  		# image

  		t.timestamps
    end

    create_table :videos do |t|
    	t.string :title
    	t.text :description

    	# image
    	# video

    	t.integer :collection_id
    	t.integer :season_id
    	t.integer :season_pos
    	t.integer :runtime_s
    	t.integer :release

    	t.timestamps
    end
  end
end
