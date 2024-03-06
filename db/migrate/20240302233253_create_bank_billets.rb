class CreateBankBillets < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_billets do |t|
      t.float :amount
      t.date :expire_at
      t.string :customer_person_name
      t.string :customer_cnpj_cpf
      t.string :customer_state
      t.string :customer_city_name
      t.string :customer_zipcode
      t.string :customer_address
      t.string :customer_address_neighborhood
      t.integer :status, default: 0
      t.string :kobana_id

      t.timestamps
    end
  end
end
