-- Quick demo commands for Redis
-- redis-cli -h 127.0.0.1 -p 6379

PING

SET demo:title "Quick Redis Demo"
GET demo:title

HSET demo:product:1 name "Mechanical Keyboard" price "89.99" in_stock "true"
HGETALL demo:product:1

LPUSH demo:events "created" "indexed" "viewed"
LRANGE demo:events 0 -1

