class CreateChildModels < ActiveRecord::Migration[6.1]
  def change
    create_table :child_models do |t|
      t.boolean :fail
      t.references :main_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
