set -euo pipefail
cd "$(dirname "$0")"

docker compose exec -T hiveserver2 beeline \
  -u jdbc:hive2://hiveserver2:10000/default -n alice -f /sql/check.sql &
alice=$!
docker compose exec -T hiveserver2 beeline \
  -u jdbc:hive2://hiveserver2:10000/default -n bob -f /sql/check.sql &
bob=$!
wait "$alice"
wait "$bob"
echo complete
