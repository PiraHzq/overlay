# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils java-pkg-2

DESCRIPTION="yEd Graph Editor - High-quality diagrams made easy"
HOMEPAGE="http://www.yworks.com/en/products_yed_about.html"
SRC_URI="yEd-${PV}.zip"
DOWNLOAD_URL="http://www.yworks.com/en/products_download.php?file=${SRC_URI}"
MY_JAR="${P}.jar"
LICENSE="yEd"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="fetch"

RDEPEND=">=virtual/jre-1.6:*"
DEPEND="
	app-arch/unzip
	${RDEPEND}"

pkg_nofetch() {
	einfo "Please download the ${SRC_URI} from"
	einfo "${DOWNLOAD_URL}"
	einfo "and place it in ${DISTDIR}"
}

src_unpack() {
	unzip "${DISTDIR}/${A}" -d "${S}"
}

src_install() {
	java-pkg_dojar "${S}/${P}"/lib/*
	java-pkg_dojar "${S}/${P}"/${PN}.jar
	java-pkg_dolauncher yed --jar ${PN}.jar
	doicon "${S}/${P}/icons/yicon32.png"
	make_desktop_entry ${PN} "yEd Graph Editor" yicon32 "Graphics;2DGraphics"
	dodoc "${S}/${P}"/license.html
}
