FactoryBot.define do
  factory :bank_billet do
    amount { 1500 }
    expire_at { Date.today.end_of_month.strftime('%Y/%m/%d') }
    customer_person_name { "Joao da Silva" }
    customer_cnpj_cpf { "563.878.830-16" }
    customer_state { "SP" }
    customer_city_name { "São Paulo" }
    customer_zipcode { "07111000" }
    customer_address { "Avenida Paulo Faccini, 208" }
    customer_address_neighborhood { "Jd Macedo" }
  end
end
