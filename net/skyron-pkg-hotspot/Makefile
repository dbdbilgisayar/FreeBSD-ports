PORTNAME=	skyron-pkg-hotspot
PORTVERSION=	2.5.2
CATEGORIES=	net
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty


MAINTAINER=	mdemir@skyronfirewall.com
COMMENT=	skyron package hotspot

LICENSE=	APACHE20

RUN_DEPENDS=	bash>0:shells/bash

NO_BUILD=	yes
NO_MTREE=	yes

SUB_FILES=	pkg-install pkg-deinstall
SUB_LIST=	PORTNAME=${PORTNAME}

do-extract:
	${MKDIR} ${WRKSRC}

do-install:
	${MKDIR} ${STAGEDIR}/etc/inc/priv
	${MKDIR} ${STAGEDIR}${PREFIX}/pkg
	${MKDIR} ${STAGEDIR}${PREFIX}/captiveportal
	${MKDIR} ${STAGEDIR}${PREFIX}/captiveportal/css
	${MKDIR} ${STAGEDIR}${PREFIX}/captiveportal/js
	${MKDIR} ${STAGEDIR}${PREFIX}/captiveportal/resim
	${MKDIR} ${STAGEDIR}${PREFIX}/captiveportal/sql
	${MKDIR} ${STAGEDIR}${PREFIX}/captiveportal/skyron
	${MKDIR} ${STAGEDIR}${DATADIR}

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/captiveportal/skyron/*.* \
	${STAGEDIR}${PREFIX}/captiveportal/skyron

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/captiveportal/css/*.* \
	${STAGEDIR}${PREFIX}/captiveportal/css

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/captiveportal/js/*.* \
	${STAGEDIR}${PREFIX}/captiveportal/js

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/captiveportal/resim/*.* \
	${STAGEDIR}${PREFIX}/captiveportal/resim

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/captiveportal/sql/*.* \
	${STAGEDIR}${PREFIX}/captiveportal/sql
	
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/pkg/*.* \
	${STAGEDIR}${PREFIX}/pkg


	${INSTALL_DATA} ${FILESDIR}${DATADIR}/info.xml \
		${STAGEDIR}${DATADIR}

	@${REINPLACE_CMD} -i '' -e "s|%%PKGVERSION%%|${PKGVERSION}|" \
		${STAGEDIR}${DATADIR}/info.xml \
		${STAGEDIR}${PREFIX}/pkg/sklhotspot.inc

.include <bsd.port.mk>
