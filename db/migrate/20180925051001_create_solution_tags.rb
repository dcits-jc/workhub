class CreateSolutionTags < ActiveRecord::Migration[5.1]
  def change
    create_table :solution_tags do |t|

      t.string :solution_type
      t.string :name

      t.timestamps
    end
  end
end
