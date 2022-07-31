#!/usr/bin/env python3


import sys
from urllib.request import Request, urlopen
import warnings

class ViewWebPage():
    """This class will connect and fetch web pages and display them"""

    def __init__(self, url:str=None) -> None:
        self._url = url if sys.argv[1] else warnings.warn("you must provide the url")

    def _fetch_url(self):
        """fetch the url and display"""
        header = Request.add_header('Accept-Language', 'sv')
        response=Request(self._url)
        req=response.add_header('Accept-Language', 'sv')
        s=urlopen(req)
        print(s.readlines())
        #req=Request('http://www.debian.org')
    
    def main(self):
        self._fetch_url()


if __name__ == "__main__":
    ViewWebPage().main()

