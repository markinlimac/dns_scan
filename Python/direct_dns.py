#!/user/bin/env python

import socket

class DirectDNS():
    def __init__(self, input):
        self.input = input
    
    def getIP(self):
        """
        This method returns the first IP address string
        that responds as the given domain name
        """
        try:
            data = socket.gethostbyname(self.input)
            ip = repr(data)
            return ip
        except Exception:
            # fail gracefully!
            return False

    def getIPx(self):
        """
        This method returns an array containing
        one or more IP address strings that respond
        as the given domain name
        """
        try:
            data = socket.gethostbyname_ex(self.input)
            ipx = repr(data[2])
            return ipx
        except Exception:
            # fail gracefully!
            return False

    def getHost(ip):
        """
        This method returns the 'True Host' name for a
        given IP address
        """
        try:
            data = socket.gethostbyaddr(ip)
            host = repr(data[0])
            return host
        except Exception:
            # fail gracefully
            return False

    def getAlias(d):
        """
        This method returns an array containing
        a list of aliases for the given domain
        """
        try:
            data = socket.gethostbyname_ex(d)
            alias = repr(data[1])
            #print repr(data)
            return alias
        except Exception:
            # fail gracefully
            return False