docker compose -p life up -d

echo "Esperando até tudo estar de pé!!!"
while true; do
  response=$(curl -s -X 'POST' \
    'http://localhost:4321/api/v1/zone-event' \
    -H 'accept: application/json' \
    -H 'api-key: b531b533e6af3c3a75' \
    -H 'Content-Type: application/json' \
    -d '{
    "zone": "test",
    "person": "joao",
    "action": "leave"
  }')

  if [[ $response == *"Created"* ]]; then
    break
  fi

  echo "Aguardando ..."
  sleep 3
done

curl -X 'POST' \
  'http://localhost:4321/api/v1/zone-event' \
  -H 'accept: application/json' \
  -H 'api-key: b531b533e6af3c3a75' \
  -H 'Content-Type: application/json' \
  -d '{
  "zone": "ACADEMY",
  "person": "joao",
  "action": "enter"
}'

sleep 1

curl -X 'POST' \
  'http://localhost:4321/api/v1/zone-event' \
  -H 'accept: application/json' \
  -H 'api-key: b531b533e6af3c3a75' \
  -H 'Content-Type: application/json' \
  -d '{
  "zone": "ACADEMY",
  "person": "maria",
  "action": "enter"
}'

sleep 1

curl -X 'POST' \
  'http://localhost:4321/api/v1/zone-event' \
  -H 'accept: application/json' \
  -H 'api-key: b531b533e6af3c3a75' \
  -H 'Content-Type: application/json' \
  -d '{
  "zone": "ACADEMY",
  "person": "joao",
  "action": "leave"
}'

sleep 1

curl -X 'POST' \
  'http://localhost:4321/api/v1/zone-event' \
  -H 'accept: application/json' \
  -H 'api-key: b531b533e6af3c3a75' \
  -H 'Content-Type: application/json' \
  -d '{
  "zone": "ACADEMY",
  "person": "maria",
  "action": "leave"
}'

sleep 1

curl -X 'POST' \
  'http://localhost:4321/api/v1/zone-event' \
  -H 'accept: application/json' \
  -H 'api-key: b531b533e6af3c3a75' \
  -H 'Content-Type: application/json' \
  -d '{
  "zone": "ACADEMY",
  "person": "joao",
  "action": "enter"
}'

sleep 1

curl -X 'POST' \
  'http://localhost:4321/api/v1/zone-event' \
  -H 'accept: application/json' \
  -H 'api-key: b531b533e6af3c3a75' \
  -H 'Content-Type: application/json' \
  -d '{
  "zone": "ACADEMY",
  "person": "joao",
  "action": "leave"
}'

echo "\n"
echo "Acesse o grafana em: http://localhost:3333/d/d8084225-6f0e-4202-a284-c79916e3aa73/academy?orgId=1"
echo "Use \033[1mgrafana\033[0m como usuario e senha"
echo "\n"