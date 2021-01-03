# Setup Godot

Github action to setup Godot to be able to use it afterwards

Use only with ubuntu.

## Example:
```
jobs:
  godot-build-solutions:
    runs-on: ubuntu-latest
    name: Build godot project
    steps:
      - uses: actions/checkout@v2
      - name: Setup Godot
        uses: remi-san/setup-godot-action@v1.0.0
        with:
          godot-version: 3.2.3
          release-name: stable
          mono: 'true'
      - run: godot --build-solutions --quit
```

You can, of course, run any `godot` command you want.
