class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.string :action
    	t.references :issue, index: true, foreign_key: true
      t.timestamps
    end
  end
end
