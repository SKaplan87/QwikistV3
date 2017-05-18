class AddActiveColumntoAgreements < ActiveRecord::Migration[5.0]
  def change
    add_column :agreements, :active, :boolean, :default => true
  end
end
