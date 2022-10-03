import sys
import os

class Menu():
  def __init__(self):
    self.printProgramIcon()
    self.wordlists = os.listdir("../Wordlists")
    self.wordlist = self.choiceWordlist()
    self.showOptions()
  
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

    def selectTool(self):
      if self.option == 1:
        self.directDNS()
      elif self.option == 2:
        reverseDNS()
      elif self.option == 3:
        zoneTransfer()
      elif self.option == 4:
        filesAndDirectories()
      elif self.option == 5:
        whois()
      elif self.option == 6:
        siteParsing()
      elif self.option == 7:
        siteParsing()
        directDNS()
        reverseDNS()
        zoneTransfer()
        filesAndDirectories()
        whois()
      else:
        print("Opção inválida!")
      return "Obrigado por usar essa ferramenta!"

class Program():
  def directDNS():
    print('oi1')

  def reverseDNS():
    print('oi2')

  def zoneTransfer():
    print('oi3')

  def filesAndDirectories():
    print('oi4')

  def whois():
    print('oi5')

  def siteParsing():
    print('oi7')

def main():
  menu = Menu()
  # option = int(input('\nEscolha uma opção: '))
  # while not option:
  #   Program(menu.userOption)
  #   option = int(input('\nEscolha uma opção: '))

if __name__ == '__main__' :
  main()