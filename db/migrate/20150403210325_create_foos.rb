class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string :text
      t.references :user, index: true

      t.timestamps
    end
  end
end
