BACKEND_DIR="$(cd "$(dirname "$0")" && pwd)"
FRONTEND_DIR="$(cd "$BACKEND_DIR/../LDJS-Front-end-Automatisez-les-tests-et-le-release-continus-avec-Docker" && pwd)"
EXIT_CODE=0

echo "=== Backend ==="
(cd "$BACKEND_DIR" && npm test) || EXIT_CODE=1

echo "=== Frontend ==="
(cd "$FRONTEND_DIR" && npm test) || EXIT_CODE=1

exit $EXIT_CODE
