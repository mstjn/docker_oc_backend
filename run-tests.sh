set -e

rm -rf test-results
mkdir -p test-results

if [ ! -d "node_modules" ]; then
  echo "node_modules absent — installation en cours..."
  npm ci
fi

if node -e "
  const p = require('./package.json');
  const deps = { ...p.dependencies, ...p.devDependencies };
  process.exit(deps['react'] ? 0 : 1);
" 2>/dev/null; then
  echo "Projet détecté : React"
  CI=true npm test
else
  echo "Projet détecté : Node / NestJS"
  npm test
fi
