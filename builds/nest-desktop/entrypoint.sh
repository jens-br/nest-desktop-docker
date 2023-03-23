#!/bin/bash

jq -n \
  --arg insite_access_enabled "${INSITE_ACCESS_ENABLED}" \
  --arg insite_access_path "${INSITE_ACCESS_PATH}" \
  --arg insite_access_port "${INSITE_ACCESS_PORT}" \
  --arg insite_access_url "${INSITE_ACCESS_URL}" \
  --arg nest_simulator_path "${NEST_SIMULATOR_PATH}" \
  --arg nest_simulator_port "${NEST_SIMULATOR_PORT}" \
  --arg nest_simulator_url "${NEST_SIMULATOR_URL}" \
  '{
    insiteAccess: {
      enabled: $insite_access_enabled,
      path: $insite_access_path,
      port: $insite_access_port,
      url: $insite_access_url
    },
    nestSimulator: {
      path: $nest_simulator_path,
      port: $nest_simulator_port,
      url: $nest_simulator_url
    }
  }' > /usr/share/nginx/html/config/app.json

exec "$@"
