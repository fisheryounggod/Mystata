
*- Examples of -spgrid- command


    spgrid, xrange(0 500) yrange(0 200) resolution(w10)   ///
        cells("GridCells.dta") points("GridPoints.dta")   ///
        replace dots
    use "GridPoints.dta", clear
    spmap using "GridCells.dta", id(spgrid_id)

    spgrid, xrange(0 500) yrange(0 200) shape(square) xdim(50)   ///
        cells("GridCells.dta") points("GridPoints.dta")          ///
        replace dots
    use "GridPoints.dta", clear
    spmap using "GridCells.dta", id(spgrid_id)

    spgrid using "Italy-OutlineCoordinates.dta",   ///
        resolution(w10) unit(kilometers)           ///
        cells("Italy-GridCells.dta")               ///
        points("Italy-GridPoints.dta")             ///
        replace dots
    use "Italy-GridPoints.dta", clear
    spmap using "Italy-GridCells.dta", id(spgrid_id)   ///
        polygon(data("Italy-OutlineCoordinates.dta")   ///
        ocolor(red) osize(thick))

    spgrid using "Italy-OutlineCoordinates.dta",   ///
        resolution(w10) unit(kilometers)           ///
        cells("Italy-GridCells.dta")               ///
        points("Italy-GridPoints.dta")             ///
        replace compress dots
    use "Italy-GridPoints.dta", clear
    spmap using "Italy-GridCells.dta", id(spgrid_id)   ///
        polygon(data("Italy-OutlineCoordinates.dta")   ///
        ocolor(red) osize(medthick))

    spgrid using "Italy-OutlineCoordinates.dta",   ///
        resolution(w10) unit(kilometers)           ///
        mapexclude("Italy-Exclude.dta")            ///
        cells("Italy-GridCells.dta")               ///
        points("Italy-GridPoints.dta")             ///
        replace compress dots
    use "Italy-GridPoints.dta", clear
    spmap using "Italy-GridCells.dta", id(spgrid_id)   ///
        polygon(data("Italy-OutlineCoordinates.dta")   ///
        ocolor(red) osize(medthick))
		
		