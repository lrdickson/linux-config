# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "jinja2",
# ]
# ///

import os
import subprocess

# pypi imports
from jinja2 import Environment, FileSystemLoader, select_autoescape


def main() -> None:
    git_base_dir = (
        subprocess.run(
            ["git", "rev-parse", "--show-toplevel"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        .stdout.decode()
        .strip()
    )
    zellij_dir = os.path.join(git_base_dir, "config", "zellij")
    layout_template_dir = os.path.join(zellij_dir, "layout_templates")
    env = Environment(
        loader=FileSystemLoader(layout_template_dir), autoescape=select_autoescape()
    )

    layout_template = env.get_template("my-default.kdl")
    layout_text = layout_template.render()

    output_layout_path = os.path.join(zellij_dir, "layouts", "my-default.kdl")
    with open(output_layout_path, "w") as file:
        file.write(layout_text)


if __name__ == "__main__":
    main()
