# apr
xpProOption(apr)
set(VER 1.5.2)
set(REPO https://github.com/smanders/apr)
set(PRO_APR
  NAME apr
  WEB "APR" http://apr.apache.org/ "Apache Portable Runtime Project website"
  LICENSE "open" http://www.apache.org/licenses/LICENSE-2.0.html "Apache 2.0"
  DESC "Apache Portable Runtime project"
  REPO "repo" ${REPO} "forked apr repo on github"
  VER ${VER}
  GIT_ORIGIN git://github.com/smanders/apr.git
  GIT_UPSTREAM git://github.com/apache/apr.git
  GIT_TRACKING_BRANCH trunk
  GIT_TAG xp${VER} # what to 'git checkout'
  GIT_REF ${VER} # create patch from this tag to 'git checkout'
  # Download APR following links at http://apr.apache.org/download.cgi (mirrors)
  #DLURL http://ftp.wayne.edu/apache/apr/apr-${VER}.tar.gz
  #DLMD5 d41d8cd98f00b204e9800998ecf8427e
  # TODO: version 1.5.2 no longer appears to be available from apache mirrors,
  #  so until we move to a new version that is available, download from the repo
  DLURL ${REPO}/archive/${VER}.tar.gz
  DLMD5 4a6bdfe8aba67891aead7f7ed11e3361
  DLNAME apr-tag-${VER}.tar.gz
  PATCH ${PATCH_DIR}/apr.patch
  DIFF ${REPO}/compare/apache:
  )
########################################
function(build_apr)
  if(NOT (XP_DEFAULT OR XP_PRO_APR))
    return()
  endif()
  xpGetArgValue(${PRO_APR} ARG VER VALUE VER)
  set(XP_CONFIGURE
    -DAPR_BUILD_TESTAPR=ON
    -DTEST_STATIC_LIBS=ON
    -DAPR_VER=${VER}
    )
  configure_file(${PRO_DIR}/use/usexp-apr-config.cmake ${STAGE_DIR}/share/cmake/
    @ONLY NEWLINE_STYLE LF
    )
  xpCmakeBuild(apr "" "${XP_CONFIGURE}" aprTargets)
  if(ARGN)
    set(${ARGN} "${aprTargets}" PARENT_SCOPE)
  endif()
endfunction()
