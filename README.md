# Dragon Hatchling Chess

Training the BDH ("Dragon Hatchling") architecture to play chess.

## Layout

- `bdh/` – vendored copy of [pathwaycom/bdh](https://github.com/pathwaycom/bdh) (MIT, see `bdh/LICENSE.md`)
  at upstream commit `2b0d7a4`. The first commit of this repo is the unmodified upstream code.
- `scripts/` – helper scripts.
- `tools/` – downloaded binaries (not tracked).

## Setup

```bash
uv venv .venv --python 3.12
uv pip install --python .venv/bin/python torch --index-url https://download.pytorch.org/whl/cu128
uv pip install --python .venv/bin/python -r requirements.txt
scripts/get_stockfish.sh
```
