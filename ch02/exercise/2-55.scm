;; '(a b c) 在求值时会替换成(quote a b c), 所以''abra 会变成'(quote abra), car后就是quote
(car ''abracadabra)
