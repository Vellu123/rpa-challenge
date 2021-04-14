import argparse
import robot
from webdrivermanager import GeckoDriverManager


output_dir = "./output"


def main():
    args = parse_arguments()

    if args.gd:
        download_gecko_driver()

    robot.run(
        "robot/main.robot",
        outputdir=output_dir,
        loglevel=args.loglevel
    )


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--loglevel",
        help="RF logging level",
        default="INFO"
    )
    parser.add_argument(
        "-gd",
        help="Download Gecko Driver",
        action="store_true"
    )
    return parser.parse_args()


def download_gecko_driver():
    gdd = GeckoDriverManager()
    gdd.download_and_install()


if __name__ == "__main__":
    main()
