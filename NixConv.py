#!/usr/bin/env python
import argparse
import re as r


def cli_parser():
    # Create a argprase parser for cli doings
    parser = argparse.ArgumentParser(
        description="A converter of Nix code to a Python dict")

    parser.add_argument('--path', type=str, action='store',
                        help='Input file containing Nix code')

    args = parser.parse_args()
    return args


def main():
    args = cli_parser()
    with open(args.path, "r") as nixFile:
        nixFileRead = r.sub("#.*|\n", "", nixFile.read())
        print(nixFileRead)


main()
