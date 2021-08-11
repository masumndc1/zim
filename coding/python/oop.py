#!/usr/bin/env python3

class shareddata:
    """this is something new"""
    def __init__(self, spam, email):
        self.spam = spam
        self.email = email

    def __str__(self):
        return "Return total of %s and %s" % (self.spam, self.email)

    def __repr__(self):
        return "Account %s, balance %s" % (self.spam, self.email)

    def emails_and_spam(self):
       return self.spam + self.email

    def emails_only(self):
       return self.email

    @property
    def spam_only(self):
       return self.spam 


