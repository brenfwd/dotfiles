from enum import Enum


class Color(Enum):
    NONE = ""

    RESET = "\u001b[0m"
    BG_CYAN_BRIGHT = "\u001b[46;1m"

    TEXT_BLACK = "\u001b[30m"
    TEXT_BLUE = "\u001b[34m"
    TEXT_GRAY = "\u001b[38;5;243m"
    TEXT_WHITE = "\u001b[37m"
    TEXT_CYAN = "\u001b[36m"
    TEXT_YELLOW = "\u001b[33m"
    TEXT_GREEN_BRIGHT = "\u001b[32;1m"
    TEXT_RED = "\u001b[31m"
    TEXT_RED_BRIGHT = "\u001b[31;1m"
    TEXT_GREEN = "\u001b[32m"

    STYLE_BOLD = "\u001b[1m"
    STYLE_ITALIC = "\u001b[3m"
