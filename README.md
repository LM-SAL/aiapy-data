# aiapy-data

Sample and test data for [aiapy](https://github.com/LM-SAL/aiapy), stored as
release assets. Keep data files out of git.

## Adding or updating data

With an authenticated [GitHub CLI](https://cli.github.com/), run:

```bash
./upload_data.sh file1.fits file2.fits
```

The script creates the `v1` release if needed, replaces assets with matching
names, and prints their download URLs and SHA-256 hashes.

Update the URLs and SHA-256 hashes in aiapy’s `pooch.retrieve` calls and
`SHA256SUMS` when adding or changing a file.
