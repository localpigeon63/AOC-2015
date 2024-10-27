require 'digest'

input = "6245634684"
hash = Digest::MD5.hexdigest(input)
pp hash