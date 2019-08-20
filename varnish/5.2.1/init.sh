#!/bin/bash
exec varnishd \
    -j unix,user=vcache \
    -F \
    -f ${VARNISH_CONFIG} \
    -s ${VARNISH_STORAGE} \
    -a ${VARNISH_LISTEN} \
    -T ${VARNISH_MANAGEMENT_LISTEN} \
    -p http_resp_hdr_len=65536 \
    -p http_resp_size=98304 \
    -p workspace_backend=98304
    ${VARNISH_DAEMON_OPTS}