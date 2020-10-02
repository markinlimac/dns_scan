import sys
import os
import socket

def printProgramIcon():
  with open("../hack.txt") as f:
    sys.stdout.write(f.read())

def choiceWordlist():
  wordlists = os.listdir("../Wordlists")
  temp = 0

  wordlist = input('\nEscolha a wordlist: ')
  for archive in wordlists:
    if (wordlist == archive):
      temp = 1

  while(temp == 0):
    if(wordlist.upper() == "SHOW"):
      for archive in wordlists:
        print(archive)
      wordlist = input('\nEscolha a wordlist: ')
      for archive in wordlists:
        if (wordlist == archive):
          temp = 1
    else:
      print("Digite uma opção valida")
      wordlist = input('\nEscolha a wordlist: ')
      for archive in wordlists:
        if (wordlist == archive):
          temp = 1
  
  return "../Wordlists/" + wordlist

def directDNS(wordlist):
  domain = input("Digite a url do site: ")
  f = open(wordlist, "r") 
  for line in f.readlines():
    line = line.strip("\n")
    try:
      dns = socket.gethostbyname(line+domain)
      print(line + domain + " ==> " + dns)
    except:
      pass
  

def reverseDNS(wordlist):
  print('oi2')

def zoneTransfer(wordlist):
  print('oi3')

def filesAndDirectories(wordlist):
  print('oi4')

def whois(wordlist):
  print('oi5')

def siteParsing(wordlist):
  print('oi7')


def menu(option, wordlist):
  print("\n1 - DNS DIRETO")
  print("2 - DNS REVERSO")
  print("3 - TRANSFERENCIA DE ZONA")
  print("4 - ARQUIVOS E DIRETORIOS")
  print("5 - WHOIS")
  print("6 - PARSING DE SITES")
  print("7 - ALL")
  print("0 - SAIR")

  userOption = int(input('\nEscolha uma opção: '))
  
  if userOption == 1:
    directDNS(wordlist)
    option = userOption
  
  elif userOption == 2:
    reverseDNS(wordlist)
    option = userOption

  elif userOption == 3:
    zoneTransfer(wordlist)
    option = userOption

  elif userOption == 4:
    filesAndDirectories(wordlist)
    option = userOption

  elif userOption == 5:
    whois(wordlist)
    option = userOption

  elif userOption == 6:
    siteParsing(wordlist)
    option = userOption

  elif userOption == 7:
    siteParsing(wordlist)
    directDNS(wordlist)
    reverseDNS(wordlist)
    zoneTransfer(wordlist)
    filesAndDirectories(wordlist)
    whois(wordlist)
    option = userOption

  elif userOption == 0:
    option = userOption
  
  else:
    print("Opção inválida!")

def main():
  option = 1
  printProgramIcon()
  wordlist = choiceWordlist()

  while(option != 0):
    menu(option, wordlist)
  return "Obrigado por usar essa ferramenta!"

if __name__ == '__main__' :
  main()