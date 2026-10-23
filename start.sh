set -euo pipefail
cd "$(dirname "$0")"

docker compose up -d --wait --wait-timeout 300
bash load.sh
bash check.sh
