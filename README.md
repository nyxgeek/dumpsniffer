# dumpsniffer
tools for analyzing strings from password lists



![image of dog sniffing](https://i.imgur.com/4TubOtW.png?1)



### overview

this project is meant to look at one password dump (or any text file) at a time. There is a settings.conf file that contains the path to the file to be searched.


The results are stored in their raw form under the following directory structures:
```
./logs/db/
./logs/db/a/
./logs/db/a/aardvark.out.txt
./logs/db/b/bitcoin.out.txt
./logs/db/c/computer.out.txt
...

```

Using the filesystem to hold data was chosen over a traditional db because this allows the easy viewing and editing of the results. This allows you to manually parse and remove false-positive results using tools like 'grep'.

---

### where to find passwords in plaintext:

https://hashes.org/public.php

Check out the 'found' column.


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


#### setup.sh
creates directories and pulls down hash list
- creates log folder to store results in (useful if you want to test another list - just rename the 'logs' or 'logs/db' folder
- prompts to download latest Have I Been Pwned solved hashes list from hashes.org
