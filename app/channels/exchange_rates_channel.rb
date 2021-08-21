class ExchangeRatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from(stream_name)
    @pairs = params[:pairs]
    receive
  end

  periodically(every: 5.seconds){ receive }

  def receive
    rates = CurrenciesRates.get(@pairs)

    rates.each do |currency, rate|
      cable_ready[stream_name].set_dataset_property(
        name: 'currencyRateValue',
        selector: "##{currency}",
        value: rate
      )
    end
    
    cable_ready.broadcast
  end
end