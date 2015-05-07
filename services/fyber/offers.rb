require 'rest-client'

module Fyber
  class Offers
    PATH   = 'http://api.sponsorpay.com/feed/v1/offers.json'

    DEFAULT_PARAMS = {
        uid:         '',
        pub0:        '',
        pages:       1,
        appid:       ENV["APP_ID"],
        device_id:   ENV['DEVICE_ID'],
        ip:          ENV['IP'],
        locale:      ENV['LOCALE'],
        offer_types: ENV['OFFER_TYPES'],
      }


    def self.call(params)
      instance = new(params)
      instance.call
      instance
    end

    def initialize(params)
      params = Hash[params.map{|(k,v)| [k.to_sym,v]}]

      @params = DEFAULT_PARAMS.merge(filtered_params(params)).merge(timestamp: timestamp)
    end

    def call
      @response = RestClient.get(PATH, { params: query_params, read_timeout: 5000, accept: :json }) { |response, request, result| response }
    end

    def offers
      json_response['offers']
    end

    private

    def query_params
      @params.merge(hashkey: hashkey)
    end

    def json_response
      JSON.parse(@response)
    end

    def timestamp
      Time.now.utc.to_i
    end

    def hashkey
      sorted_params = @params.sort.to_h
      Digest::SHA1.hexdigest "#{URI.encode_www_form(sorted_params)}&#{ENV['API_KEY']}"
    end

    def filtered_params(params)
      params.select{|k,v| DEFAULT_PARAMS.keys.include?(k)}
    end

  end
end