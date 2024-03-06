class BankBillet < ApplicationRecord
  validates :amount, :expire_at, :customer_person_name, :customer_cnpj_cpf, presence: true
  validates :customer_state, :customer_city_name, :customer_zipcode, presence: true
  validates :customer_address, :customer_address_neighborhood, presence: true

  enum status: { opened: 0, canceled: 1, paid: 2 }
end
