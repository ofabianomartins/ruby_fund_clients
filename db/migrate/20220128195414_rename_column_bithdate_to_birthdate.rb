class RenameColumnBithdateToBirthdate < ActiveRecord::Migration[7.0]
  def change
    rename_column :clients, :bithdate, :birthdate
  end
end
