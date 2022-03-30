
PATH="${SYNOPKG_PKGDEST}/bin:${PATH}"
GROUP="sc-rest-server"

INST_ETC="/var/packages/${SYNOPKG_PKGNAME}/etc"
INST_VARIABLES="${INST_ETC}/installer-variables"
ENV_VARIABLES="${SYNOPKG_PKGVAR}/environment-variables"

# Reload wizard variables stored by postinst
if [ -r "${INST_VARIABLES}" ]; then
    # we cannot source the file to reload the variables, when values have special characters like <, >, ...
    for _line in $(cat "${INST_VARIABLES}"); do
        _key="$(echo ${_line} | awk -F'=' '{print $1}')"
        _value="$(echo ${_line} | awk -F'=' '{print $2}')"
        declare "${_key}=${_value}"
    done
fi

export HOME="${SYNOPKG_PKGVAR}"

# Prepare command line parameters here, so that the code in ${ENV_VARIABLES}
# can override them completely if required.
REST_SERVER_ARGS="--path ${WIZARD_DATA_VOLUME}/${WIZARD_DATA_DIRECTORY} --listen ${WIZARD_LISTEN_ADDRESS}:${WIZARD_LISTEN_PORT}"
if [ "${WIZARD_APPEND_ONLY}" == "true" ]; then
    REST_SERVER_ARGS="${REST_SERVER_ARGS} --append-only"
fi
if [ "${WIZARD_NO_AUTH}" == "true" ]; then
    REST_SERVER_ARGS="${REST_SERVER_ARGS} --no-auth"
fi
if [ "${WIZARD_PRIVATE_REPOS}" == "true" ]; then
    REST_SERVER_ARGS="${REST_SERVER_ARGS} --private-repos"
fi
if [ "${WIZARD_PROMETHEUS}" == "true" ]; then
    REST_SERVER_ARGS="${REST_SERVER_ARGS} --prometheus"
fi
if [ "${WIZARD_PROMETHEUS_NO_AUTH}" == "true" ]; then
    REST_SERVER_ARGS="${REST_SERVER_ARGS} --prometheus-no-auth"
fi

# Load custom variables
if [ -r "${ENV_VARIABLES}" ]; then
    . "${ENV_VARIABLES}"
fi

SERVICE_COMMAND="${SYNOPKG_PKGDEST}/bin/rest-server ${REST_SERVER_ARGS} ${REST_SERVER_EXTRA_ARGS}"
SVC_BACKGROUND=y
SVC_WRITE_PID=y


service_postinst ()
{
    echo WIZARD_DATA_VOLUME="${wizard_data_volume}"                     >> ${INST_VARIABLES}
    echo WIZARD_DATA_DIRECTORY="${wizard_data_directory}"               >> ${INST_VARIABLES}
    echo WIZARD_LISTEN_ADDRESS="${wizard_listen_address}"               >> ${INST_VARIABLES}
    echo WIZARD_LISTEN_PORT="${wizard_listen_port}"                     >> ${INST_VARIABLES}
    echo WIZARD_APPEND_ONLY="${wizard_append_only}"                     >> ${INST_VARIABLES}
    echo WIZARD_NO_AUTH="${wizard_no_auth}"                             >> ${INST_VARIABLES}
    echo WIZARD_PRIVATE_REPOS="${wizard_private_repos}"                 >> ${INST_VARIABLES}
    echo WIZARD_PROMETHEUS="${wizard_prometheus}"                       >> ${INST_VARIABLES}
    echo WIZARD_PROMETHEUS_NO_AUTH="${wizard_prometheus_no_auth}"       >> ${INST_VARIABLES}
}

