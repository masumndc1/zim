#!/usr/bin/env python3

import sys
import argparse    
from urllib.request import urlopen

class ViewWebPage():
    """This class will connect and fetch web pages and display them"""

    def __init__(self, url):
        self._url = 'http://' + url if url.startswith('www') else url

    def _fetch_url(self):
        """fetch content of the url and display.
        for example the content of http://www.google.com"""

        s=urlopen(self._url)
        print(s.url, s.status, s.headers, s.code)

    def main(self):
        self._fetch_url()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-u", "--url", help="point to url")
    args = parser.parse_args()

    ViewWebPage(args.url).main() if args.url else print("usage: {} [-h] [-u URL]".format(sys.argv[0]))