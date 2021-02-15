class RateController < ApplicationController
  def show
    response = HTTParty.get('http://data.fixer.io/api/latest?access_key=d05624c7ada7d02bfc843ef4d4b07238&symbols=ARS')
    parsed_json = ActiveSupport::JSON.decode(response.body)
    rate = parsed_json["rates"]["ARS"]
    print(rate)
    @rate = rate
  end
end
