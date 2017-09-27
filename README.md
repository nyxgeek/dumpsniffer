# dumpsniffer
tools for analyzing strings from password lists



![image of dog sniffing](https://i.imgur.com/4TubOtW.png?1)



### overview

this project is meant to look at one password dump (or any text file) at a time. There is a dumpsniffer.conf file that contains the path to the password dump to be searched.


The search results are stored in their raw form under the following directory structures:
```
./db/
./db/a/
./db/a/aardvark.out.txt
./db/a/awesome.out.txt
./db/b/bitcoin.out.txt
./db/c/computer.out.txt
...

```


Using the filesystem to hold data was chosen over a traditional db because this allows the easy viewing and editing of the results. This allows you to manually parse and remove false-positive results using tools like 'grep'.

---

### where to find passwords in plaintext:

https://hashes.org/public.php

Check out the 'found' column.

You can automagically download and clean the Troy Hunt dump using the included script 'getcleanwordlist.sh'

```
./getcleanwordlist.sh
```

***Please consider donating to hashes.org***

They're an awesome resource.  You can find the donation link at the bottom of this page:

https://hashes.org/index.php

---

### file list & usage




#### popcon.sh

Popularity Contest: compare popularity of keywords or phrases

note: if a word is already in the db, it won't be searhed again

```
usage:
./popcon.sh hacking hacker hacked

Search complete:
19993, hacker
2805, hacked
1799, hacking

```


#### viewresults.sh

show top 50 most-popular variations on a keyword

note: if word has not been searched for yet, will prompt to search

```
usage:
./viewresults.sh hacking

1066 hacking
  61 hackingme
  16 hackings
  12 hackingyou
  12 hackingisfun
  10 hackingmaster
  10 hackingm
   8 hackinghaters
   8 hackingaccount
   7 hackingis
     ...

```

#### createregex.sh

```
usage:
./createregex.sh file.txt > file.regex

Read line "testing":

[tT+7][eE3][sS$5][tT+7][iI1!|][nN][gG69]
```

give this script a file with one word/phrase per line and it will convert output it as leetspeak regex


This can then be used with grep in the following manner:

```
grep -E -f file.regex file_to_search.txt
```


#### getcleanwordlist.sh

```
usage:
./getcleanwordlist.sh
```

That's it. It downloads and cleans the wordlist a little (trims lines longer than 24 char and removes non-ASCII). Outputs it to 


#### DerbyCon_Files folder

##### DerbyCon_7.0_100_Million_Secrets.pdf

PDF of slide deck

#### cleverbrute_create.sh

script to turn a wordlist into two wordlists to be used in CLEVERBRUTE attack method

##### resources.md

This is a list of the URLs/resources listed in the slide deck


---

### thanks!
thanks for all the feedback! also special thanks to whoever it was at DerbyCon that recommended the dog icon after my talk.

@nyxgeek
