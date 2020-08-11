# Modeloutput

In this section we will describe all possible modeloutput of the CN-WS model. Tables are written as txt-files, rasters are written as [Idrisi-rasters](https://gdal.org/drivers/raster/Idrisi.html).

## Routing only output

When the user chooses to only use the routing algorithm of the cn-ws model, following output can be generated.

### `routing.txt`

Tab seperated table wich contains a row for every pixel in the spatial domain. For every pixel (row in the table) the following collumns are present:
- col, row: the position of the pixel in the raster
- target1col, target1row: the position of the first targetpixel in the raster. These values are -99 if target1 does not exist.
- part1: the relative amount of outgoing sediment/water to the first target pixel
- distance1: the distance between the sourcepixel and the first target pixel
- target2col, target2row: the position of the second targetpixel in the raster. These values are -99 if target2 does not exist.
- part2: the relative amount of outgoing sediment/water to the second target pixel. Togheter with part1 the sum must be 1.
- distance2: the distance between the sourcepixel and the second target pixel

The routing table is only generated when `write routing table = 1`.

### `routing_missing.txt`

Tab seperated table with the same headers as routing.txt. The entries in the table are a subset of those in routing.txt and are only included if...

The routing table is only generated when `write routing table = 1`.

### `LS.rst`

Raster with the calculated LS-factor (dimensionless). This raster is only written if `write ls factor = 1`.

### `AspectMap.rst`

Raster with the direction of slope (the aspect) in radians. This raster is only written if `write aspect = 1`.

### `SLOPE.rst`

Raster with the calculated slope in radians. This raster is only written if `write slope = 1`.

### `UPAREA.rst`

Raster with the total upstream area (m²) for every pixel. This raster is only written if `write upstream area = 1`.

## WaTEM-SEDEM output

When the WaTEM-SEDEM model is used (`simple = 1`), the following rasters and tables can be written as output.

### `Total Sediment.txt`

Txt-file where the first five rows give a summary of the results:
- Total erosion (kg)
- Total deposition (kg)
- Sediment leaving the catchment, via the river (kg)
- Sediment leaving the catchment, not via the river (kg)
- Sediment trapped in buffers (kg)

The file contains from 9th row on a tab-seprated table where for every outlet the amount of incoming sediment is reported.

### `Total Sediment VHA.txt`

Tab seperated table. Every row contains the id of a river segment and the total amount of sediment (kg) entering the segment.
This table is only generated when `Output per VHA river segment = 1`.

### `Cumulative sediment VHA.txt`

This table is only generated when `Output per VHA river segment = 1`.

### `Clay content sediment.txt`

Tab seperated table with the mean clay content (%) at every outlet. This table is only generated when `estimate clay content = 1`.

### `cumulative.rst`

TO DO

### `sewer_in.rst`

Raster with the amount of sediment (kg) that is trapped in every sewer pixel. This raster is only generated when `Include sewers = 1`.

### `SediExport_kg.rst`

Raster with for every river cell the calculated amounts of sedimentinput (kg). This raster is only written if `write sediment export = 1`.

### `SediOut_kg.rst`

Raster with the amount of sediment (kg) that leaves every pixel and is distributed between the two target pixels.
This raster is only written if `write sediment export = 1`.

### `SediIn_kg.rst`

Raster with the amount of sediment (kg) that enters a pixel from the upstream pixels.
This raster is only written if `write sediment export = 1`.

### `WATEREROS (kg per gridcel).rst`

Raster with the total amount of erosion or sedimentation in every pixel in kg. Negative values
indicate erosion (i.e. Incoming Sediment + RUSLE < Capacity), positive values indicate sedimentation
(i.e. Incoming Sediment + RUSLE > Capacity). This raster is only written if `write water erosion = 1`.

### `WATEREROS (mm per gridcel).rst`

Raster with the total amount of erosion or sedimentation in every pixel in mm. Negative values
indicate erosion (i.e. Incoming Sediment + RUSLE < Capacity), positive values indicate sedimentation
(i.e. Incoming Sediment + RUSLE > Capacity). This raster is only written if `write water erosion = 1`.

### `Capacity.rst`

Raster with the calculated transport capacity (kg/m²) for every pixel.

### `RUSLE.rst`

Raster with the calculated RUSLE-values, the potential soil loss, for every pixel in kg/m².
This raster is only written if `write rusle = 1`

### `TILEROS.rst`

Raster with the calculated tillage erosion (mm/year). Negative values indicate erosion, positive values give sedimentation.
This raster is only written if `calculate tillage erosion = 1`.

## CN-output

When the CN-module is enabled (`simple=0`) it is possible to generate some additional output.

### `Discharge.txt`

Table with discharge (m³/s) as a function of time for every outlet.

### `Discharge_VHA.txt`

Table with discharge (m³/s) as a function of time for every river segment. This table is only
generated when `Output per VHA river segment = 1`.

### `Sediment concentration.txt`

Table with the concentration of sediment (g/l) as a function of time for every outlet.

### `Sediment concentration_VHA.txt`

Table with the concentration of sediment (g/l) as a function of time for every river segment.
This table is only generated when `Output per VHA river segment = 1`.

### `Sediment.txt`

Table with the sediment load (kg) as a function of time for every outlet.

### `Sediment_VHA.txt`

Table with the sediment load (kg) as a function of time for river segment.
This table is only generated when `Output per VHA river segment = 1`.

### `Spillover per buffer.txt`

Table with the amount of water (m³) that leaves every buffer basin via the overflow.

### `Total discharge.txt`

Table with the total amount of water (m³) that arives in every outlet after a rainfall event.

### `Remap.rst`

Raster with the total amount of discharge (=rainfall - infiltration) per pixel for a rainfall event.

### `Total runoff.rst`

Raster with total runoff (m³) generated in every pixel during a rainfall event. The value in every pixel
is the sum of the amount of rainfall and the amount of water flowing from upstream pixels, minus the infiltration
in the pixel.

# Modeloutput options

In the above section all outputfiles where described. In this section, the different outputoptions and the linked
files are described.

Following keys in the section `[Output maps]` adapt the output:
- `write aspect` (bool, default false): write AspectMap.rst
- `write LS factor` (bool, default false): write LS.rst
- `write upsream area` (bool, default false): write UPAREA.rst
- `write slope` (bool, default false): write SLOPE.rst
- `write routing table` (bool, default false): writes routing.txt and routing_missing.txt
- `write routing column/row` (bool, default false):
- `write RUSLE` (bool, default false): writes RUSLE.rst
- `write sediment export` (bool, default false): writes SediExport_kg.rst, SediIn_kg.rst, SediOut_kg.rst
- `write water erosion` (bool, default false): writes WATEREROS (kg per gridcel).rst and WATEREROS (mm per gridcel).rst
- `write rainfall exces` (bool, default false): writes Remap.rst
- `write total runoff` (bool, default false): writes Total runoff.rst

In the section `[User Choices]` two keys impose some output too:
- `Include sewer` (bool, default false): writes sewer_in.rst
- `Output per VHA river segment` (bool, default false): writes Total Sediment VHA.txt, Total discharge.txt, Sediment_VHA.txt,
Sediment concentration_VHA.txt, Cumulative sediment VHA.txt