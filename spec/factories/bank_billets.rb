FactoryBot.define do
  factory :bank_billet do
    amount { 1.5 }
    expire_at { "2024-03-02" }
    customer_person_name { "MyString" }
    customer_cnpj_cpf { "MyString" }
    customer_state { "MyString" }
    customer_city_name { "MyString" }
    customer_zipcode { "MyString" }
    customer_address { "MyString" }
    customer_address_neighborhood { "MyString" }
  end
end
