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
        loglevel=args.loglevel,
        dryrun=args.dryrun,
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
    parser.add_argument(
        "--dryrun",
        help="Dryrun robot",
        action="store_true",
        default=False
    )
    return parser.parse_args()


def download_gecko_driver():
    gd = GeckoDriverManager()
    gd.download_and_install()


if __name__ == "__main__":
    main()
