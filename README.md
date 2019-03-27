NOTE: This is an as-is reference RDK WPE adaptation layer for use with RDK-V setups. Used for reference and to modify into your own.

# Getting started

1. Untar RDK-V tarball
2. Repo init and sync
3. Clone this repo add to RDK-V meta layers directory
4. Clone `meta-wpe` and optionally `meta-wpe-restricted`
5. Setup environment, chose your box
6. `bitbake-layers add-layer <this layer>`
7. `bitbake-layers add-layer meta-wpe` (and optionally `meta-wpe-restricted`)
8. `bitbake rdk-wpe-generic` to create an image based off of this layre

To play with different settings please see `conf\layer.conf` for more features.
Good luck!
