# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="a multi-system chiptune tracker compatible with DefleMask modules"
HOMEPAGE="https://github.com/tildearrow/furnace"

# when performing updates, check whether the project has switched to a new
# version of adpcm. adpcm doesn't seem to update frequently.
SRC_URI="
	https://github.com/tildearrow/furnace/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="jack"

RDEPEND="
	dev-libs/libfmt:=
	media-libs/alsa-lib
	media-libs/freetype
	media-libs/libglvnd
	media-libs/libsdl2
	media-libs/libsndfile
	media-libs/portaudio
	media-libs/rtmidi
	sci-libs/fftw
	virtual/zlib:=
	x11-themes/hicolor-icon-theme
	jack? ( virtual/jack )
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/0001-fix-undefined-uint8.patch"
)

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_GUI=ON
		-DSHOW_OPEN_ASSETS_MENU_ENTRY=ON
		-DSYSTEM_FFTW=ON
		-DSYSTEM_FMT=ON
		-DSYSTEM_LIBSNDFILE=ON
		-DSYSTEM_PORTAUDIO=ON
		-DSYSTEM_RTMIDI=ON
		-DSYSTEM_SDL2=ON
		-DSYSTEM_ZLIB=ON
		-DWITH_DEMOS=ON
		-DWITH_INSTRUMENTS=ON
		-DWITH_WAVETABLES=ON
		-DWITH_JACK="$(usex jack ON OFF)"
	)

	cmake_src_configure
}
