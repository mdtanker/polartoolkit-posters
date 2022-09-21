```python
fetch.bedmap2(layer="icebase")
```

```python
from antarctic_plots import fetch
```

```python
ross_ice_shelf = regions.ross_ice_shelf
```

```python
ross_ice_shelf = regions.ross_ice_shelf
```

```python
# download
gravity = fetch.gravity(type='BA') 
GHF = fetch.geothermal(version='losing-ebbing-2021')

# set properties
data = profile.make_data_dict(
    ["Bouguer gravity", "Geothermal heat flux"],
    [gravity, GHF],
    ["blue", "red"])

# draw profile location
lines = maps.draw_lines()
line = utils.shapes_to_df(lines)

# plot
profile.plot_profile(
    method = "polyline",
    polyline = line,
    num = 100,
    data_dict = data,
    add_map = True)
```

```python
# download
ice_thickness = fetch.bedmachine(
    layer = "thickness",  
    region = regions.amery_ice_shelf, 
    spacing = 1000)

# plot
fig = maps.plot_grd(
    grid = ice_thickness,
    cmap = "cool",
    coast = True,
    cbar_label = "Ice thickness (m)",
    inset = True,
    scalebar = True)

# show
fig.show()
```