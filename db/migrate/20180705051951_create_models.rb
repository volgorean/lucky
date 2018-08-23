class CreateModels < ActiveRecord::Migration[5.2]
  def change
  	create_table :shows do |t|
  		t.string :title
  		t.text :description
      t.string :release

  		t.timestamps
    end

    create_table :seasons do |t|
      t.string :title
      t.text :description
      
      t.integer :show_id
      t.integer :season_number

      t.timestamps
    end

    create_table :videos do |t|
    	t.string :title
    	t.text :description

    	t.integer :show_id
    	t.integer :season_id
    	t.integer :episode_number
    	t.integer :runtime_s
    	t.string :release

    	t.timestamps
    end
  end
end
