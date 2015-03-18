class CreateTasks < ActiveRecord::Migration
  def change
    create_table :spree_tasks do |t|
      t.references :user, index: true
      t.string     :name, default: '', null: false
      t.text       :description
      t.boolean    :is_available, default: true, null: false
      t.timestamps
    end
  end
end
