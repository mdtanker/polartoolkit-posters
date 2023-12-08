# Code blocks to screenshot for the poster

```python
>>> # get pre-defined region for Pine Island Glacier
>>> print(regions.pine_island_glacier)
(-1720000.0, -1480000.0, -380000.0, -70000.0)
```

```python
>>> # download and resample data
>>> grid = fetch.bedmap2(
>>>     layer = "icebase",
>>>     spacing = 10e3,
>>>     region = regions.mcmurdo_dry_valleys,
>>>     reference = "ellipsoid",
>>>     registration = "p",
>>> )
>>> # print out grid info
>>> info = utils.get_grid_info(grid, print_info=True)
```
```
INFO: calculating icebase from surface and thickness grids
INFO: converting to be referenced to the WGS84 ellipsoid
INFO: spacing larger than original, filtering and resampling

grid spacing: 10000.0 m
grid region: (320000.0, 480000.0, -1400000.0, -1220000.0)
grid zmin: -367.387145996
grid zmax: 2637.80517578
grid registration: p
```

```python
# download data
ice_thickness = fetch.bedmap2(
    layer="thickness",
    region=regions.amery_ice_shelf,
)

# plot map
fig = maps.plot_grd(
    ice_thickness,
    fig_height=12,              # set figure height
    cmap="dense",               # set the colormap
    grd2cpt=True,               # scale colormap limits to grid
    coast=True,                 # plot grounding and coastlines
    title="Amery Ice Shelf",    # add title
    cbar_label="Ice thickness", # add label
    cbar_unit="m",              # add units
    inset=True,                 # add inset map
    inset_width=.2,             # proportional width of inset
    scalebar=True,              # add scalebar
    scale_position="n.75/-.07", # position of scalebar
    gridlines=True,             # add lat/lon gridlines
    x_spacing=10,               # longitude interval (deg)
    y_spacing=2,                # latitude interval (deg)
    hist=True,                  # add a histogram
    hist_bin_num=100,           # number of bins
)

# display
fig.show()
```

```python
# download data
gravity = fetch.gravity(
    version="antgg-update",
    anomaly_type="BA",
)
GHF = fetch.ghf(version='losing-ebbing-2021')

# add data and properties to a dictionary
data = profile.make_data_dict(
    names = ["Bouguer gravity", "Geothermal heat flux"],
    grids = [gravity, GHF],
    colors = ["blue", "red"],
    axes = [0,1], # use seperate y axes for plotting
)

# get shapefile for profile location
shapefile=fetch.sample_shp("Disco_deep_transect")

# plot
fig, _, _ = profile.plot_profile(
    method = "shapefile",
    shapefile = shapefile,
    data_dict = data,
    add_map = True,
    subplot_orientation="vertical",
    data_legend_loc="JBR+jBR+o0c",
    layers_legend_loc="JTR+jTR+o0c",
)
fig.show()
```

```python
# define a region
region = regions.pine_island_glacier

# download data
bedmachine = fetch.bedmachine(
    "bed",
    spacing=1e3,
    region=region,
)
bedmap = fetch.bedmap2(
    "bed",
    spacing=1e3,
    region=region,
)

# compare grids and plot
_ = utils.grd_compare(
    bedmachine,
    bedmap,
    plot=True,
    coast=True,
    robust=True,
    grid1_name="BedMachine ",
    grid2_name="Bedmap2",
    cbar_label="Bed elevation (m)",
    hist=True,
)
```