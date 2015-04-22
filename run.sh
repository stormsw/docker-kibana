#!/bin/sh

set -e

KIBANA_CONF_FILE="/opt/kibana-${KIBANA_VERSION}/config.js"

ELASTIC_URL=${ELASTIC_URL:-http://localhost:9200}

sed -i "s;elasticsearch:.*;elasticsearch: \"${ELASTIC_URL}\",;" "${KIBANA_CONF_FILE}"

if [ -n "${KIBANA_INDEX}" ]; then
    echo "setting index!"
    sed -i "s;kibana_index:.*;kibana_index: \"${KIBANA_INDEX}\",;" "${KIBANA_CONF_FILE}"
fi

# mesos-friendly change
unset HOST
unset PORT
npm install connect serve-static
exec /opt/kibana-${KIBANA_VERSION}/node/bin/node server.js
