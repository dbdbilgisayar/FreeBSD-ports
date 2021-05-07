PORTNAME=	skyron-pkg-5651log
PORTVERSION=	2.5.1
CATEGORIES=	net
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty


MAINTAINER=	mdemir@skyronfirewall.com
COMMENT=	skyron package 5651log

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
	${MKDIR} ${STAGEDIR}${PREFIX}/www/shortcuts
	${MKDIR} ${STAGEDIR}${PREFIX}/www/imzalar
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/bck
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/conf
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/dbprs
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/imzala
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/install
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/language
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/logtodb
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/manager
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/mysql/install
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/pkg
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/tools
	${MKDIR} ${STAGEDIR}${PREFIX}/5651log/trlog
	${MKDIR} ${STAGEDIR}${DATADIR}

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/pkg/* \
	${STAGEDIR}${PREFIX}/pkg
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/conf/openssl.cnf  \
	${STAGEDIR}${PREFIX}/5651log/conf
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/dbprs/*.*  \
	${STAGEDIR}${PREFIX}/5651log/dbprs
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/imzala/*.*  \
	${STAGEDIR}${PREFIX}/5651log/imzala
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/install/*.*  \
	${STAGEDIR}${PREFIX}/5651log/install
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/language/*.*  \
	${STAGEDIR}${PREFIX}/5651log/language
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/manager/*.*  \
	${STAGEDIR}${PREFIX}/5651log/manager
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/mysql/install/*.*  \
	${STAGEDIR}${PREFIX}/5651log/mysql/install
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/pkg/*.*  \
	${STAGEDIR}${PREFIX}/5651log/pkg
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/tools/*.*  \
	${STAGEDIR}${PREFIX}/5651log/tools
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/trlog/*.*  \
	${STAGEDIR}${PREFIX}/5651log/trlog
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/5651log/*.*  \
	${STAGEDIR}${PREFIX}/5651log

	${INSTALL_DATA} ${FILESDIR}/etc/inc/priv/5651log.priv.inc \
		${STAGEDIR}/etc/inc/priv

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/pkg/5651log.xml \
		${STAGEDIR}${PREFIX}/pkg

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/www/shortcuts/pkg_5651log.inc \
		${STAGEDIR}${PREFIX}/www/shortcuts

	${INSTALL_DATA} ${FILESDIR}${PREFIX}/www/imzalar/*.php \
		${STAGEDIR}${PREFIX}/www/imzalar
		
	${INSTALL_DATA} ${FILESDIR}${DATADIR}/info.xml \
		${STAGEDIR}${DATADIR}

	@${REINPLACE_CMD} -i '' -e "s|%%PKGVERSION%%|${PKGVERSION}|" \
		${STAGEDIR}${DATADIR}/info.xml \
		${STAGEDIR}${PREFIX}/pkg/skl5651log.xml

.include <bsd.port.mk>