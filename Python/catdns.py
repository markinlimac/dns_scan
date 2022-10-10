#!/user/bin/env python

import sys
import os
from direct_dns import *
import socket
import whois
import ipaddress

class Menu():
  def __init__(self):
    self.printProgramIcon()
    self.wordlists = os.listdir("../Wordlists")
    self.wordlist = "../Wordlists/" + self.choiceWordlist()
    self.option = 1
  
  def printProgramIcon(self):
    with open("../hack.txt") as f:
      sys.stdout.write(f.read())
  
  def choiceWordlist(self):
    temp = 0

    while(not temp):
      wordlist = input('\nEscolha a wordlist: ')
      if wordlist in self.wordlists:
        temp = 1
      elif wordlist.upper() == "SHOW":
        for archive in self.wordlists:
          print(archive)
      else:
        print("Digite uma opção valida")

    return wordlist
  
  def showOptions(self):
      print("\n1 - DNS DIRETO")
      print("2 - DNS REVERSO")
      print("3 - TRANSFERENCIA DE ZONA")
      print("4 - ARQUIVOS E DIRETORIOS")
      print("5 - WHOIS")
      print("6 - PARSING DE SITES")
      print("7 - ALL")
      print("0 - SAIR")
      self.option = int(input('\nEscolha uma opção: '))

class Program():
  def selectTool(self, menu):
    if menu.option == 1: #direct DNS
      url = input("Digite a url do site > ")
      wordlist = open(menu.wordlist, 'r')
      for word in wordlist.readlines():
        word = word.strip().replace('.', '')
        domain = word+'.'+url
        iplist = DirectDNS(domain).getIPx()
        if iplist:
          print(domain + ' => ' + str(iplist))

    elif menu.option == 2: #reverse DNS
      ip = input("Digite o ip > ")
      range = input("Digite a faixa (notação CIDR) > ")
      for x in ipaddress.ip_interface(ip+'/'+range).network:
        try:
          data = socket.gethostbyaddr(str(x))
          host = repr(data[0])
          print(str(x) + ' => ' + host)
        except Exception:
          pass

    elif menu.option == 3:
      self.zoneTransfer()
    elif menu.option == 4:
      self.filesAndDirectories()
    elif menu.option == 5:
      self.whois()
    elif menu.option == 6:
      self.siteParsing()
    elif menu.option == 7:
      self.siteParsing()
      self.directDNS()
      self.reverseDNS()
      self.zoneTransfer()
      self.filesAndDirectories()
      self.whois()
    elif menu.option == 0:
      print("Obrigado por usar essa ferramenta!")
    else:
      print("Opção inválida!")

  def zoneTransfer(self):
    print('oi3')

  def filesAndDirectories(self):
    print('oi4')

  def whois(self):
    print('oi5')

  def siteParsing(self):
    print('oi7')

def main():
  menu = Menu()
  tool = Program()
  while(menu.option != 0):
    menu.showOptions()
    tool.selectTool(menu)


if __name__ == '__main__' :
  main()