class CreateMainModels < ActiveRecord::Migration[6.1]
  def change
    create_table :main_models do |t|
      t.string :title

      t.timestamps
    end
  end
end
