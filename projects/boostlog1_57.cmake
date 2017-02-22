# boost log
set(VER 1.57.0)
string(REGEX REPLACE "([0-9]+)\\.([0-9]+)(\\.[0-9]+)?" "\\1_\\2" VER2_ ${VER}) # 1_57
set(REPO https://github.com/smanders/log)
set(PRO_BOOSTLOG${VER2_}
  NAME boostlog${VER2_}
  SUPERPRO boost
  SUBDIR libs/log
  WEB "log" http://boost.org/libs/log "boost log website"
  LICENSE "open" http://www.boost.org/users/license.html "Boost Software License"
  DESC "logging library"
  REPO "repo" ${REPO} "forked log repo on github"
  VER ${VER}
  GIT_ORIGIN git://github.com/smanders/log.git
  GIT_UPSTREAM git://github.com/boostorg/log.git
  GIT_TRACKING_BRANCH develop
  GIT_TAG xp${VER}
  GIT_REF boost-${VER}
  PATCH ${PATCH_DIR}/boost.log.${VER2_}.patch
  DIFF ${REPO}/compare/boostorg:
  )