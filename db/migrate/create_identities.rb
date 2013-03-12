class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, :null => false
      t.string :provider
      t.string :access_token, :limit => 1000
      t.timestamps
    end
  end
end
