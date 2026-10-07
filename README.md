# Docker-fig2dev

Minimal Alpine image with `fig2dev` and Ghostscript.

Build the image:

```sh
docker build -t fig2dev .
```

Interactive shell in the current directory:

```sh
docker run --rm -it -v "$PWD:/work" fig2dev
```

Convert `drawing.fig` to PDF directly:

```sh
docker run --rm -v "$PWD:/work" fig2dev fig2dev -L pdf drawing.fig drawing.pdf
```

## Maintenance

GitHub repository **Settings > Secrets and variables > Actions**: add secrets `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN`, plus variable `DOCKERHUB_IMAGE` (for example, `drdpham/fig2dev`).

To rotate an expiring token, create a replacement with read/write access in Docker Hub **Account Settings > Personal access tokens**, update GitHub's `DOCKERHUB_TOKEN` secret, then revoke the old token.

Make sure to renew the Docker Hub token when updating the Dockerfile so that GitHub Actions can continue to publish the image successfully. 

After changing the Dockerfile, commit and push to `main`; GitHub Actions builds and publishes `latest`. To publish a version, push a tag such as `v1.0.0`. (Pull requests build without publishing.)

