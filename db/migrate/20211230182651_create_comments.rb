class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :record, polymorphic: true, null: false
      t.string :text

      t.timestamps
    end
  end
end
