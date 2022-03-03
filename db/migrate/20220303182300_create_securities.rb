class CreateSecurities < ActiveRecord::Migration[7.0]
  def change
    create_table :securities do |t|
      t.string :symbol
      t.string :isin

      t.timestamps
    end
  end
end
