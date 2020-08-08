"""
Generates recent versions according to the commit history of local master.
"""

# Standard library imports:
from argparse import ArgumentDefaultsHelpFormatter, ArgumentParser

# Third-party imports:
from git import Repo

# Local imports:
from .release import build_map, update_build

if __name__ == "__main__":
    # Create the argument parser.
    parser = ArgumentParser(
        "Generate Versions",
        description="Builds maps for all recent git commits.",
        formatter_class=ArgumentDefaultsHelpFormatter,
    )

    # Add the arguments.
    parser.add_argument(
        "--force",
        type=bool,
        default=False,
        help="Allow unsafe usage that may overwrite unsaved changes.",
    )

    # Parse the arguments.
    args = parser.parse_args()

    # Create the repository object to track git changes.
    repo = Repo()

    # Block potentially damaging operations.
    if repo.is_dirty(untracked_files=True) and not args.force:
        exit("")
