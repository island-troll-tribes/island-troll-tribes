"""
Generates recent versions according to the commit history of local master.
"""

# Standard library imports:
from argparse import ArgumentDefaultsHelpFormatter, ArgumentParser
from math import ceil, log

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
    parser.add_argument(
        "--base",
        default="base.w3x",
        help="Path of the map."
    )
    parser.add_argument(
        "count",
        type=int,
        default=2,
        help="Number of commits to iterate over.",
    )

    # Parse the arguments.
    args = parser.parse_args()

    # Create the repository object to track git changes.
    repo = Repo()

    # Cache the originating branch name.
    try:
        branch = repo.active_branch
    except TypeError:
        exit("Ensure that the git head is not detached.")

    # Block potentially damaging operations.
    if repo.is_dirty(untracked_files=True) and not args.force:
        exit("Enable --force to run on a dirty workspace.")

    # Detach from the head to avoid overwriting any commit history.
    repo.git.checkout("--detach")

    # Mirror the originating branch, clearing any unsaved changes.
    repo.git.reset("--hard", branch)

    # Compute the number of digits required to represent the versions.
    num_digits = ceil(log(args.count, 10))

    # Iterate to generate all requested versions.
    for index in range(args.count):
        # Get the SHA for the most recent commit.
        sha = repo.head.ref

        # Construct a unique name for this version.
        version = f"generated.{index:0{num_digits}}.{sha}"

        # Update the build output.
        _, target = update_build(version)

        # Build the map.
        build_map(args.base, target)

        # Step back a commit.
        repo.git.reset("--hard", "HEAD~1")

    # Reset to the originating branch.
    repo.git.checkout(branch)
