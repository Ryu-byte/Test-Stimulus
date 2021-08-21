class ConverterChannel < ApplicationCable::Channel
  def subscribed
    stream_from(stream_name)
  end

  def receive(data)
    count, currency = data['value'].split(' ')
    pair = "#{currency.upcase}RUB"
    rate = CurrenciesRates.get([pair])[pair]

    cable_ready[stream_name].set_dataset_property(
      name: 'converterResultValue',
      selector: "#converter",
      value: rate
    )

    cable_ready.broadcast
  end
end