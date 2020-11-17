# Depends docker action
This action executes depends analysis.

## Inputs

### args

**Required** The CLI args corresponding to the language and the source folder, defaults are java and src.

## Outputs

### `depends`

The result of the depends analysis in JSON format.

## Example usage

_.github/workflows/main.yml_

```
on: [push]

jobs:
  depends_job:
    runs-on: ubuntu-latest
    name: Depends analysis.
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Execute depends.
        id: depends
        uses: hdmsantander/depends-docker-action@1.0
        with:
          args: ${{ env.workspace }} java src
```
