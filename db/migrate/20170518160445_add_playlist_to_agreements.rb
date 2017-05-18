class AddPlaylistToAgreements < ActiveRecord::Migration[5.0]
  def change
    add_column :agreements, :playlist, :string
  end
end
