import sys
import os

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
  
  return wordlist

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
    directDNS()
    option = userOption
  
  elif userOption == 2:
    reverseDNS()
    option = userOption

  elif userOption == 3:
    zoneTransfer()
    option = userOption

  elif userOption == 4:
    filesAndDirectories()
    option = userOption

  elif userOption == 5:
    whois()
    option = userOption

  elif userOption == 6:
    siteParsing()
    option = userOption

  elif userOption == 7:
    siteParsing()
    directDNS()
    reverseDNS()
    zoneTransfer()
    filesAndDirectories()
    whois()
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