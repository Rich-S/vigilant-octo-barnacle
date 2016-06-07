class CreateProjectMaterials < ActiveRecord::Migration
  def change
    create_table :project_materials do |t|
      t.integer :project_id, index: true
      t.integer :material_id, index: true
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
