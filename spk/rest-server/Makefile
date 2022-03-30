SPK_NAME = rest-server
SPK_VERS = 0.11.0
SPK_REV = 0
SPK_ICON = src/restic.png

DEPENDS = cross/$(SPK_NAME)

UNSUPPORTED_ARCHS = $(PPC_ARCHS)

MAINTAINER = sigprof
DESCRIPTION = Rest Server is a high performance HTTP server that implements restic's REST backend API.
DISPLAY_NAME = Rest Server
CHANGELOG = "Initial package release."
LICENSE_FILE = $(WORK_DIR)/$(SPK_NAME)/LICENSE
HOMEPAGE = https://github.com/restic/rest-server
LICENSE = BSD

WIZARDS_DIR = src/wizard

STARTABLE = yes
SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT_TITLE = $(DISPLAY_NAME)
SERVICE_WIZARD_SHARE = wizard_data_directory
USE_DATA_SHARE_WORKER = yes
FWPORTS = src/rest-server.sc

POST_STRIP_TARGET = rest_server_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: rest_server_extra_install
rest_server_extra_install:
	@install -d -m 755 $(STAGING_DIR)/var
	@install -m 644 src/environment-variables $(STAGING_DIR)/var/
