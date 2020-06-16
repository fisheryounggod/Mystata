use surf3,replace
surface x y z, saving(s3a)
surface x y z, nowire saving(s3b)
surface x y z, orient(zxy) saving(s3c)
surface x y z, orient(xzy) saving(s3d)
use surf5,replace
surface x y z, saving(s5)
use surf6,replace
surface x y z, saving(s6)
use surf6,replace
surface x y z, round(20) saving(s6b)
use surf7,replace
surface x y z, saving(s7)
use surf8,replace
surface x y z, saving(s8)

*gphpen -deps s3a
*gphpen -deps s3b
*gphpen -deps s3c
*gphpen -deps s3d
*gphpen -deps s5
*gphpen -deps s6
*gphpen -deps s6b
*gphpen -deps s7
*gphpen -deps s8



