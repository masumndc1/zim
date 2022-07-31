#!/usr/bin/env python3

"""
python3 header_practise.py http://www.webpage.com
"""

import sys
from urllib.request import Request, urlopen
import warnings


class ViewWebPage():
    """This class will connect and fetch web pages and display them"""

    def __init__(self):
        try:
            self._url = sys.argv[1]
        except IndexError:
            print("you have not passed url")

    def _fetch_url(self) -> None:
        """fetch content of the url and display.
        for example the content of http://www.debian.org"""

        try:
           response=Request(self._url)
           s=urlopen(response)
           print(s.readlines())
        except AttributeError:
            print("url is missing")

    def main(self):
        self._fetch_url()


if __name__ == "__main__":
    ViewWebPage().main()

