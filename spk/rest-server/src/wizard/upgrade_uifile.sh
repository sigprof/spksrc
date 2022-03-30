#!/bin/sh

INST_ETC="/var/packages/${SYNOPKG_PKGNAME}/etc"
INST_VARIABLES="${INST_ETC}/installer-variables"

# Reload wizard variables stored by postinst
if [ -r "${INST_VARIABLES}" ]; then
    # we cannot source the file to reload the variables, when values have special characters like <, >, ...
    for _line in $(cat "${INST_VARIABLES}"); do
        _key="$(echo ${_line} | awk -F'=' '{print $1}')"
        _value="$(echo ${_line} | awk -F'=' '{print $2}')"
        declare "${_key}=${_value}"
    done
fi

# TODO: actually substitute the previous values as defaults
cat <<'EOF' > $SYNOPKG_TEMP_LOGFILE
[
   {
      "step_title": "Rest Server data folder location",
      "invalid_next_disabled": true,
      "items": [
         {
            "type": "combobox",
            "desc": "Please select a volume to use for the data folder",
            "subitems": [
               {
                  "key": "wizard_data_volume",
                  "desc": "Volume name",
                  "displayField": "display_name",
                  "valueField": "volume_path",
                  "editable": false,
                  "mode": "remote",
                  "api_store": {
                     "api": "SYNO.Core.Storage.Volume",
                     "method": "list",
                     "version": 1,
                     "baseParams": {
                        "limit": -1,
                        "offset": 0,
                        "location": "internal"
                     },
                     "root": "volumes",
                     "idProperty": "volume_path",
                     "fields": [
                        "display_name",
                        "volume_path"
                     ]
                  },
                  "validator": {
                     "fn": "{console.log(arguments);return true;}"
                  }
               }
            ]
         },
         {
            "type": "textfield",
            "desc": "Data shared folder (using the volume chosen above)",
            "subitems": [
               {
                  "key": "wizard_data_directory",
                  "desc": "Data shared folder",
                  "defaultValue": "restic",
                  "validator": {
                     "allowBlank": false,
                     "regex": {
                        "expr": "/^[\\w _-]+$/",
                        "errorText": "Subdirectories are not supported."
                     }
                  }
               }
            ]
         },
         {
            "desc": "The folder will be created on demand as regular DSM shared folder for the service user <b>sc-rest-server</b>. For details about the DSM permissions see <a target=\"_blank\" href=\"https://github.com/SynoCommunity/spksrc/wiki/Permission-Management\">Permission Management</a>.<p/>"
         }
      ]
   },
   {
      "step_title": "Rest Server network configuration",
      "invalid_next_disabled": true,
      "items": [
         {
            "type": "textfield",
            "desc": "Listen address and port",
            "subitems": [
               {
                  "key": "wizard_listen_address",
                  "desc": "IP address",
                  "validator": {
                     "allowBlank": true,
                     "regex": {
                        "expr": "/^(([1-9]?\\d|1\\d\\d|2[0-4]\\d|25[0-5])\\.){3}([1-9]?\\d|1\\d\\d|2[0-4]\\d|25[0-5])$/",
                        "errorText": "Only IPv4 numeric addresses (e.g., 192.168.1.2) are supported"
                     }
                  }
               },
               {
                  "key": "wizard_listen_port",
                  "desc": "Port",
                  "defaultValue": "8960",
                  "validator": {
                     "allowBlank": false,
                     "regex": {
                        "expr": "/^[1-9][0-9]{2,4}$/",
                        "errorText": "Port must be in range 100-65535"
                     }
                  }
               }
            ]
         },
         {
            "desc": "<p>Leave the <b>IP address</b> field blank if you want to make the Rest Server directly accessible on all IP addresses assigned to your NAS. Specify the loopback address (<b>127.0.0.1</b>) if you want to put a reverse proxy in front of Rest Server or use SSH port forwarding.</p><p>Note that the default port number used by this package was changed from the upstream default of 8000 to 8960 to avoid conflicts with other SynoCommunity packages.</p>"
         }
      ]
   },
   {
      "step_title": "Rest Server options",
      "invalid_next_disabled": true,
      "items": [
         {
            "type": "multiselect",
            "desc": "Rest Server options",
            "subitems": [
               {
                  "key": "wizard_append_only",
                  "desc": "Enable append only mode"
               },
               {
                  "key": "wizard_no_auth",
                  "desc": "Disable .htpasswd authentication"
               },
               {
                  "key": "wizard_private_repos",
                  "desc": "Users can only access their private repo"
               },
               {
                  "key": "wizard_prometheus",
                  "desc": "Enable Prometheus metrics"
               },
               {
                  "key": "wizard_prometheus_no_auth",
                  "desc": "Disable authentication for Prometheus metrics"
               }
            ]
         }
      ]
   }
]
EOF
exit 0
