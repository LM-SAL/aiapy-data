# aiapy-data

Sample and test data files for the [aiapy](https://github.com/LM-SAL/aiapy)
documentation gallery.

The files are attached as **release assets**, following
[irispy-data](https://github.com/LM-SAL/irispy-data) and
[muse-data](https://github.com/LM-SAL/muse-data). The git tree contains the
documentation, checksums, and upload script. The Fe XVIII example downloads
the files on demand with SunPy's data manager, verifies their SHA-256 hashes,
and caches them locally.

Download URL pattern:

```text
https://github.com/LM-SAL/aiapy-data/releases/download/v1/<filename>
```

## Initial dataset

These are the original, full-disk AIA level 1 FITS files from the JSOC
`aia.lev1_euv_12s` series near 2011-11-08 16:34 UT, used by
`examples/isolate_fe18_emission.py` in aiapy. They have not been cropped,
resampled, normalized, or otherwise modified. The example performs pointing
updates, registration, degradation correction, and exposure normalization.

| Channel | Observation time (UTC) | Release asset |
| --- | --- | --- |
| 94 Å | 2011-11-08 16:34:04 | `aia.lev1_euv_12s.2011-11-08T163404Z.94.image_lev1.fits` |
| 171 Å | 2011-11-08 16:34:13 | `aia.lev1_euv_12s.2011-11-08T163413Z.171.image_lev1.fits` |
| 193 Å | 2011-11-08 16:34:09 | `aia.lev1_euv_12s.2011-11-08T163409Z.193.image_lev1.fits` |

The observations cover the active region shown in Figure 12 of
[Warren, Winebarger, and Brooks (2012)](https://doi.org/10.1088/0004-637X/759/2/141).
Data credit: NASA/SDO and the AIA science team; distributed through
[JSOC](https://jsoc.stanford.edu/).

`SHA256SUMS` records the checksums of the initial assets. To verify downloaded
copies, run `sha256sum -c SHA256SUMS` in the directory containing the files.

## Adding or updating files

Use `upload_data.sh` with the authenticated [GitHub CLI](https://cli.github.com/):

```bash
./upload_data.sh path/to/file1.fits path/to/file2.fits
```

Use the `v1` tag, following the other LM-SAL data repositories. The uploader
replaces assets with matching names and prints their URLs and SHA-256 hashes.
When changing a file, update its checksum here and in aiapy in the same change.
Keep large data files out of git; upload them as release assets.
