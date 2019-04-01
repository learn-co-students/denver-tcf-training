class CreateCats < ActiveRecord::Migration[5.2]
  # def up
  #   create_table :cats do |table|
  #     table.string :cats
  #     table.integer :owner_id
  #   end
  #
  #   change_column :cats, :owner_id, :float
  # end
  #
  # def down
  #   drop_table :cats
  # 
  #   change_column :cats, :owner_id, :integers
  # end

  def change
    create_table :cats do |table|
      table.string :cats
      table.integer :owner_id
    end
  end
end
