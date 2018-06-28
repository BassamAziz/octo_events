class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
		t.integer :number, index: true
		t.integer :state
      t.timestamps
    end
  end
end
