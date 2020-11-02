class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string     :postalcode,      null: false
      t.integer    :prefecture_id,  null: false
      t.string     :shipaddess,      null: false
      t.string     :shiptoaddess,    null: false
      t.string     :shipbuilding
      t.string     :mobile,          null: false
      t.references :order,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
