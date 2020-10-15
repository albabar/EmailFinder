class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension('citext') unless extensions.include?('citext')

    create_table :users do |t|
      t.citext :first_name
      t.citext :last_name
      t.citext :domain
      t.string :email, index: { unique: true }

      t.timestamps
    end
  end
end
