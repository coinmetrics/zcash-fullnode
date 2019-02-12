# Zcash docker image

This is unofficial Zcash docker image.

It is being used internally at Coin Metrics, and is published in the hope it will be useful, but without any warranty. No support is available. You are using it at your own risk.

## Using image

[![Docker Repository on Quay](https://quay.io/repository/coinmetrics/fullnode-zcash/status "Docker Repository on Quay")](https://quay.io/repository/coinmetrics/fullnode-zcash)

```
docker pull quay.io/coinmetrics/fullnode-zcash:<version>
```

## Security

This image uses official binaries from https://z.cash/. zkSNARK parameters are downloaded and included at build time with official `zcash-fetch-parahs` script.

Image is built on shared Gitlab CI runners provided by Gitlab.com. [CI logs](https://gitlab.com/coinmetrics/fullnodes/zcash/pipelines)

## License

Content of this repository is made available under MIT license, see LICENSE file.
Note that this repository only contains scripts to download binaries or build ones from source.
Those binaries or sources are distributed under their own licenses.
Please consult upstream documentation for details.
