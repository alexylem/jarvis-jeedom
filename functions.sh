#!/usr/bin/env bash
jeedom_call () {
    local cmd="curl --silent --fail --show-error \"http://$jv_pg_jd_ip:$jv_pg_jd_port/${jv_pg_jd_path}core/api/jeeApi.php?apikey=$jv_pg_jd_apikey&type=interact\" --data-urlencode \"query=$1\""
    $verbose && jv_debug "$cmd"
    response="$(eval $cmd 2>&1)" # local hide return code
    local return_code=$?
    if [ $return_code -ne 0 ]; then
        jv_error "ERROR: $response"
        jv_warning "HELP: verify jeedom plugin configuration"
        jv_warning "HELP: troubleshoot by running above curl command in terminal"
    else
        say "$response"
    fi
    return $return_code
}
