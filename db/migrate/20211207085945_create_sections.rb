class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.references :article, null: false, foreign_key: true
      t.references :advertisement, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
