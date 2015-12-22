
# get source package files in tar.gz (from packrat dir)

# copy over to github cran git (hd)

# compile for windows

srcPath = "D:/sandbox/hd/src/contrib"
winPath = "D:/sandbox/hd/bin/windows/contrib/3.2"
mavPath = "D:/sandbox/hd/bin/macosx/mavericks/contrib/3.2"

src2win <- function(pkg) {
  cmd = paste0('D:/apps/R/R-32~1.2/bin/i386/R CMD INSTALL  --build ', pkg)
  system(cmd)
}

hdsrc = list.files(pattern = "*.tar.gz")

lapply(hdsrc, src2win)

# copy zip files over to windows binary directory

#dst = "D:/sandbox/hd/bin/windows/contrib/3.2"
zpf = list.files(pattern = "*.zip")
file.copy(zpf, winPath)

# delete zip files
unlink(zpf)

# update file listings
tools::write_PACKAGES(srcPath, type = 'source')
tools::write_PACKAGES(winPath)

# when installing for windows: download files in separate HIDAP libs directory (no trailing /)

# when starting hidap: use local hidap lib!
