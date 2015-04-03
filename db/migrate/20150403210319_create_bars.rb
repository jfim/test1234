class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.references :foo, index: true
      t.string :text

      t.timestamps
    end
  end
end
