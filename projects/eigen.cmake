# eigen
xpProOption(eigen)
set(VER 3.2.7)
set(PRO_EIGEN
  NAME Eigen
  WEB "Eigen" http://eigen.tuxfamily.org/ "Eigen website"
  LICENSE "open" "http://eigen.tuxfamily.org/index.php?title=Main_Page#License" "Eigen license: MPL2 (aka Mozilla Public License)"
  DESC "C++ template library for linear algebra"
  REPO "repo" https://bitbucket.org/eigen/eigen "eigen hg repo on bitbucket"
  VER ${VER}
  DLURL https://gitlab.com/libeigen/eigen/-/archive/${VER}/eigen-${VER}.tar.bz2
  DLMD5 efad2bd915ca85c8de5b7e095c64ca2b
  DLNAME eigen-${VER}.tar.bz2
  )
########################################
function(build_eigen)
  if(NOT (XP_DEFAULT OR XP_PRO_EIGEN))
    return()
  endif()
  xpGetArgValue(${PRO_EIGEN} ARG VER VALUE VER)
  set(verDir /eigen_${VER})
  set(XP_CONFIGURE -DEIGEN_BUILD_PKGCONFIG:BOOL=OFF -DEIGEN_INCLUDE_INSTALL_DIR:PATH=include${verDir}/eigen3)
  configure_file(${PRO_DIR}/use/usexp-eigen-config.cmake ${STAGE_DIR}/share/cmake/
    @ONLY NEWLINE_STYLE LF
    )
  # since eigen is currently header only, do a single build config
  set(BUILD_CONFIGS Release)
  xpCmakeBuild(eigen "" "${XP_CONFIGURE}" eigenTargets)
  if(ARGN)
    set(${ARGN} "${eigenTargets}" PARENT_SCOPE)
  endif()
endfunction()
