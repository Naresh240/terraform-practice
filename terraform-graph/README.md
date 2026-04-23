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
