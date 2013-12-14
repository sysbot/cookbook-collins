#
# Cookbook Name:: collins
# Library:: secure_random
#
# Copyright 2013, Bao Nguyen
#
# All rights reserved

require 'securerandom'

module Collins
  module Helpers  
    def random_hex
      hex = String.new
      hex = SecureRandom.hex(24)
      hex
    end
    def random_num
      num = Numeric.new
      num = SecureRandom.random_number(9999)
      num 
    end
  end
end
