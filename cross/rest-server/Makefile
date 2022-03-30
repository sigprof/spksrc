PKG_NAME = rest-server
PKG_VERS = 0.11.0
PKG_RELEASE_TAG = v$(PKG_VERS)
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/restic/rest-server/releases/download/$(PKG_RELEASE_TAG)
PKG_DIST_FILE = $(PKG_DIST_NAME)
PKG_DIR = $(PKG_NAME)
EXTRACT_PATH = $(WORK_DIR)/$(PKG_DIR)

BUILD_DEPENDS = native/go

HOMEPAGE = https://github.com/restic/rest-server
COMMENT  = Rest Server is a high performance HTTP server that implements restic's REST backend API.
LICENSE  = BSD

GO_SRC_DIR = $(EXTRACT_PATH)/cmd/rest-server
GO_BIN_DIR = $(GO_SRC_DIR)/$(PKG_NAME)

GO_LDFLAGS  = -s -w

include ../../mk/spksrc.cross-go.mk
