# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  attr_reader :url, :uri

  extend Forwardable
  include Comparable

  def initialize(url)
    @url = url
    @uri = URI(url)
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_params
    params = {}
    if @uri.query
      URI.decode_www_form(@uri.query).each_with_object(params) do |pairs, params|
        params[pairs.first.to_sym] = pairs.last
      end
    else
      params
    end
  end

  def query_param(key, value = nil)
    query_params.include?(key) ? query_params[key] : value
  end

  def <=>(other)
    if (url == other.url) ||
      (scheme == other.scheme && port == other.port && host == other.host && query_params == other.query_params)
      0
    else
      1
    end
  end
end
# END
