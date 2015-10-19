class CreateFamily < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.column :given_name, :string
      t.column :family_name, :string
      t.column :mother_id, :integer
      t.column :father_id, :integer

    end 
  end
end
