require 'uri'
require 'net/http'

class KobanaService
  BASE_URI = "https://api-sandbox.kobana.com.br/v1/bank_billets".freeze
  KOBANA_TOKEN = ENV.fetch('KOBANA_TOKEN')

  def initialize(bank_billet)
    @bank_billet = bank_billet
  end

  def create_bank_billet
    response_body = send_to_kobana
    @bank_billet.update!(kobana_id: response_body["id"])
  end

  private

  attr_accessor :bank_billet

  def send_to_kobana
    url = URI(BASE_URI)
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request.body = JSON.generate(payload)
    
    add_headers(request)

    response = http.request(request)

    JSON.parse(response.body)
  end

  def payload
    {
      amount: bank_billet.amount,
      expire_at: bank_billet.expire_at.strftime('%Y/%m/%d'),
      customer_person_name: bank_billet.customer_city_name,
      customer_cnpj_cpf: bank_billet.customer_cnpj_cpf,
      customer_state: bank_billet.customer_state,
      customer_city_name: bank_billet.customer_city_name,
      customer_zipcode: bank_billet.customer_zipcode,
      customer_address: bank_billet.customer_address,
      customer_neighborhood: bank_billet.customer_address_neighborhood
    }
  end

  def add_headers(request)
    request["accept"] = 'application/json'
    request["content-type"] = 'application/json'
    request["authorization"] = "Bearer #{KOBANA_TOKEN}"
  end
end
