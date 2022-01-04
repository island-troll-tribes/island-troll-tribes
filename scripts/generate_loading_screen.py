from PIL import Image, ImageFont, ImageDraw
from datetime import date
from pathlib import Path
from textwrap import wrap

resource_path = Path("scripts")

# Metric is in pixel, manually fetched from photoshop using the ruler
CHANGE_LOG_HEIGHT = 255
CHANGE_LOG_WIDTH = 800

FONT_FILE = "LifeCraft_Font.ttf"
VERSION_TITLE_FONT_SIZE = 20
CHANGE_LOG_FONT_SIZE = 15

# Compute boundaries for the changelogs text
MAX_CHAR = int(CHANGE_LOG_WIDTH / CHANGE_LOG_FONT_SIZE)
MAX_LINE = int(CHANGE_LOG_HEIGHT / CHANGE_LOG_FONT_SIZE)

# Offset in pixel
IMG_BACKDROP_OFFSET_X = 650
IMG_VERSION_TITLE_OFFSET_Y = 300
IMG_CHANGELOG_OFFSET_Y = 330


def generate_loading_screen(changelogs: list, version: str):

    # Open loading screen base image
    img = Image.open(resource_path / "LoadingScreenFall2021.jpg")

    # Wrap each change line so they don't expand on the loading screen border
    # This return a nested list of string line cut at MAX_CHAR
    # e.g:
    # [
    # ['Added global message indicating when a player chooses',
    # 'to be an observer.'
    # ]
    # ]
    lines = [wrap("*" + line, MAX_CHAR) for line in changelogs]

    line_count = 0
    changelogs.clear()
    for change in lines:
        if len(change) + line_count > MAX_LINE:
            break
        line_count += len(change)

        # join nested list, indenting with 2 spaces to align lines on the image
        changelogs.append("\n  ".join(change))

    # Join every change lines into a str to be drawn on the loading image
    changelogs = "\n".join(changelogs)

    title = f"Version {version} released on the " + date.today().strftime("%d/%m/%Y")

    draw = ImageDraw.Draw(img)

    font_title = ImageFont.truetype(
        str(resource_path / FONT_FILE), VERSION_TITLE_FONT_SIZE
    )
    font_changelog = ImageFont.truetype(
        str(resource_path / FONT_FILE), CHANGE_LOG_FONT_SIZE
    )

    # Color picked from photoshop, used on the base image title
    color = (232, 187, 28, 255)

    # Draw title on the loading screen
    draw.text(
        (IMG_BACKDROP_OFFSET_X, IMG_VERSION_TITLE_OFFSET_Y),
        title,
        font=font_title,
        fill=color,
    )

    # Draw changelogs on the loading screen
    draw.text(
        (IMG_BACKDROP_OFFSET_X, IMG_CHANGELOG_OFFSET_Y),
        changelogs,
        font=font_changelog,
        fill=color,
    )

    # TODO: Add error handling?
    img.save("imports/LoadingScreen.tga")
    print("Saved new image in imports/LoadingScreen.tga")


if __name__ == "__main__":

    # Testing value
    version = "3.9b"
    changelogs = [
        "Added 30% Spell Resistance to Mammoth & Disco Duck.",
        "Added global message indicating when a player chooses to be an observer.",
        "Decreased damage by 4 and attack speed from 1 to 1.75 for Adolescent and Adult Elk.",
        "Fixed bug where Shapeshifter would stutter during transformations.",
        "Fixed bug where transport ship could be crafted without -enable-boat mode.",
        "Improved the armor reduction for Greater Track armor from 4 to 5; duration, from 30 to 25 seconds; cooldown, from 50 to 35 seconds.",
        "Increased radius for Reveal slightly: for level 1 from 1000 to 1200, for level 2 from 1700 to 1800.",
        "Prevented Shield Bash from targeting bosses.",
        "Reduced Shapeshifter's Bear Form damage from 25 -> 17.",
        "Reduced minimum mana burn for Mage Masher from 10 to 7.",
        "Removed healing from Bear's Bulwark.",
        "Removed troll cursor that was used for the Undead race.",
        "Removed visual effect associated with mana burn for items that only drain mana.",
        "Replaced the -as command with -dps.",
    ]
    generate_loading_screen(changelogs, version)
