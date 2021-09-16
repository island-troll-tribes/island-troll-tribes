from PIL import Image, ImageFont, ImageDraw
from datetime import date
from pathlib import Path

resource_path = Path("scripts")

# Metric is in pixel, manually fetched from photoshop using the ruler
CHANGE_LOG_HEIGHT = 255
CHANGE_LOG_WIDTH = 800

VERSION_TITLE_FONT_SIZE = 20
CHANGE_LOG_FONT_SIZE = 15

# Compute boundaries for the changelogs text
MAX_CHAR = int(CHANGE_LOG_WIDTH / CHANGE_LOG_FONT_SIZE)
MAX_LINE = int(CHANGE_LOG_HEIGHT / CHANGE_LOG_FONT_SIZE)

# Offset in pixel
IMG_BACKDROP_OFFSET_X = 650
IMG_VERSION_TITLE_OFFSET_Y = 300
IMG_CHANGELOG_OFFSET_Y = 330


def slice_changelogs(changelogs):
    """ Slice changelogs string if line count exceed MAX_LINE
    """
    newline_count = 0
    for i, line in enumerate(changelogs):
        for j, char in enumerate(line):
            if char == "\n":
                newline_count += 1
            if newline_count >= MAX_LINE:
                return changelogs[:i]
        newline_count += 1
    return changelogs

def generate_loading_screen(changelogs, title):

    # Open loading screen base image PSD
    img = Image.open(resource_path / "LoadingScreenFall2021.jpg")

    # Insert new line if line size exceed MAX_CHAR
    for i, line in enumerate(changelogs):
        if len(line) > MAX_CHAR:
                j = MAX_CHAR
                # Find index of previous word
                while line[j] != " " and j > 0:
                    j -= 1
                # Add a new line before previous word
                changelogs[i] = line[0:j] + "\n" + line[j+1:]

    changelogs = slice_changelogs(changelogs)

    # Add '*' at the start of changelog line for clarity
    # Adding it to the first element, join will add it for the rest of the list
    changelogs[0] = "*" + changelogs[0]
    changelogs = "\n*".join(changelogs)

    title = f"Version {version} released on the" + date.today().strftime("%d/%m/%Y")

    draw = ImageDraw.Draw(img)

    font_title = ImageFont.truetype(str(resource_path / "LifeCraft_Font.ttf"), VERSION_TITLE_FONT_SIZE)
    font_changelog = ImageFont.truetype(str(resource_path / "LifeCraft_Font.ttf"), CHANGE_LOG_FONT_SIZE)

    color = (232, 187, 28, 255)

    # Draw title on the loading screen
    draw.text((IMG_BACKDROP_OFFSET_X , IMG_VERSION_TITLE_OFFSET_Y), title,
              font=font_title, fill=color)

    # Draw changelogs on the loading screen
    draw.text((IMG_BACKDROP_OFFSET_X , IMG_CHANGELOG_OFFSET_Y), changelogs,
              font=font_changelog, fill=color)

    img.save("imports/LoadingScreen.tga")


if __name__ == "__main__":

    # Testing value
    version = "3.9b"
    changelogs = [
    "Added a text tag to visualize the mechanical effects of Mix Energy and Mix Heat.",
    "Added the Anchor Soul ability, which prevents a unit from dying momentarily.",
    "Fixed bug where Bonfire failed to heat nearby units.",
    "Fixed bug where Cloaks would not grant +3 to all stats.",
    "Fixed bug where Sniff would locate targets incorrectly.",
    "Fixed bug where simultaneous transactions could desynchronize shared gold.",
    "Fixed bug where the Ancient Hydra would occasionally return to its spawn.",
    "Fixed mana regeneration rate for Replenish Energy.",
    "Replaced Reincarnation with Anchor Soul for both Master Healer and Sage.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one.",
    "Replaced model for Workshop with a custom one."
    ]
    generate_loading_screen(changelogs, version)
