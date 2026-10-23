set -euo pipefail
cd "$(dirname "$0")"

docker compose exec -T hiveserver2 beeline \
  -u jdbc:hive2://hiveserver2:10000/default -n hive -f /sql/load.sql
