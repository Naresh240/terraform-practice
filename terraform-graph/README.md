# terraform-graph

Purpose
- Quick reference to generate and render the Terraform resource dependency graph for this workspace.

Prerequisites
- terraform CLI installed and on PATH
- graphviz installed (provides `dot` for rendering: https://graphviz.org/)
- run these commands from Bash (your shell is `bash.exe`)

Quick commands

Change to the folder and initialize (if needed):

```bash
cd "C:/Users/nares/Downloads/classes/Feb'26/terraform/terraform-practice/terraform-graph"
terraform init
```

Produce a graph (DOT format) representing the planned/apply graph:

```bash
# simple: write DOT to a file
terraform graph -type=plan > graph.dot

# Open [graphviz online](https://dreampuf.github.io/GraphvizOnline/?engine=dot#digraph%20G%20%7B%0A%0A%20%20subgraph%20cluster_0%20%7B%0A%20%20%20%20style%3Dfilled%3B%0A%20%20%20%20color%3Dlightgrey%3B%0A%20%20%20%20node%20%5Bstyle%3Dfilled%2Ccolor%3Dwhite%5D%3B%0A%20%20%20%20a0%20-%3E%20a1%20-%3E%20a2%20-%3E%20a3%3B%0A%20%20%20%20label%20%3D%20%22process%20%231%22%3B%0A%20%20%7D%0A%0A%20%20subgraph%20cluster_1%20%7B%0A%20%20%20%20node%20%5Bstyle%3Dfilled%5D%3B%0A%20%20%20%20b0%20-%3E%20b1%20-%3E%20b2%20-%3E%20b3%3B%0A%20%20%20%20label%20%3D%20%22process%20%232%22%3B%0A%20%20%20%20color%3Dblue%0A%20%20%7D%0A%20%20start%20-%3E%20a0%3B%0A%20%20start%20-%3E%20b0%3B%0A%20%20a1%20-%3E%20b3%3B%0A%20%20b2%20-%3E%20a3%3B%0A%20%20a3%20-%3E%20a0%3B%0A%20%20a3%20-%3E%20end%3B%0A%20%20b3%20-%3E%20end%3B%0A%0A%20%20start%20%5Bshape%3DMdiamond%5D%3B%0A%20%20end%20%5Bshape%3DMsquare%5D%3B%0A%7D) and paste content of ```graph.dot```
```

```bash
# or pipe directly to dot and render PNG
terraform graph -type=plan | dot -Tpng -o graph.png
```

Render to other formats

```bash
# SVG (good for zoomable web viewing)
terraform graph -type=plan | dot -Tsvg -o graph.svg

# PDF
terraform graph -type=plan | dot -Tpdf -o graph.pdf
```

Helpful flags
- `-module-depth=N` (Terraform 0.12+) limits module expansion depth, useful to simplify large graphs.
- `-draw-cycles` shows cyclic edges when present.

Notes
- The graph shows resource dependencies; use `-type=plan` to visualize the planned graph.
- If you want a graph for a specific workspace, `terraform workspace select <name>` first, then run `terraform graph`.
- Large configurations may produce very large DOT files; use `-module-depth` or filter/simplify before rendering.

If you'd like, I can:
- Add a small script (`render-graph.sh`) to automate render steps, or
- Generate a sample graph for your current workspace and add the generated `graph.png` to this folder.
