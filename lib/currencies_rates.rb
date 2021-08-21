class CurrenciesRates

  API_KEY = 'API_KEY'
  API_URL = 'https://currate.ru/api/'

  class << self

    delegate :get, to: :new

  end

  def get(pairs)
    @pairs = pairs

    rates || {}
  rescue StandardError => e
    Rails.logger.error "[#{self.class.name}] error request #{e} #{e.backtrace.last(5).join("\n")}"
    {}
  end

  private


  def rates
    response = HTTParty.get "#{API_URL}?get=rates&pairs=#{@pairs.join(',')}&key=#{API_KEY}"

    JSON.parse(response.body).dig('data')
  end


end